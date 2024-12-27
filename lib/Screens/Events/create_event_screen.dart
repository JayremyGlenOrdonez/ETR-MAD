import 'package:etrmad/Styles/custom_colors.dart';
import 'package:etrmad/Styles/fonts.dart';
import 'package:etrmad/utils/custom_tools.dart';
import 'package:etrmad/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final eventNameController = TextEditingController();

  final eventVenueController = TextEditingController();

  final eventDescriptionController = TextEditingController();

  final eventDateTimeController = TextEditingController();

  DateTime? selectedDate;

  TimeOfDay? selectedTime;

  bool isReminder = false;
  bool isPackingReminder = true;
  bool isRetrieveReminder = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    //
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                primaryColor,
                secondaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: const Text(
            'Create Event',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontFamily: fontFamily,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.black),
            onPressed: () {
              print('Event Name: ${eventNameController.text}');
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFF00A6D8),
              tabs: [
                Tab(text: 'Details'),
                Tab(text: 'Item List'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  eventDetailsForm(context),
                  itemList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget eventDetailsForm(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            textFormField(
              label: 'Enter event name',
              controller: eventNameController,
            ),

            gap(height: 14.0),
            textFormField(
              label: 'Enter venue or address (Optional)',
              controller: eventVenueController,
            ),
            gap(height: 14.0),
            textFormField(
              label: 'Add extra details (e.g., theme, dress code)',
              controller: eventDescriptionController,
              maxLine: 3,
            ),
            gap(height: 14.0),

            // Date Picker
            dateTimeFormField(
              context,
              controller: eventDateTimeController,
              label: 'Event Date & Time',
              onTap: () => pickDateTime(context),
            ),

            gap(height: 16.0),
            divider(),
            gap(height: 16.0),

            reminderToggle(),
            gap(height: 16.0),
            createReminder(),
          ],
        ),
      ),
    );
  }

  Widget itemList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '- No items added yet -',
            style: TextStyle(
              fontSize: 14,
              color: labelColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          gap(height: 16.0),
          MaterialButton(
            color: primaryColor,
            textColor: Colors.white,
            onPressed: () {},
            child: const Text('Add Item'),
          ),
        ],
      ),
    );
  }

  void pickDateTime(BuildContext context) async {
    final date = await pickDate(context, initialDate: selectedDate);
    if (date == null) return;
    final time = await pickTime(context, initialTime: selectedTime);
    if (time != null) {
      setState(() {
        selectedDate = date;
        selectedTime = time;

        // Format date and time
        final formattedDate = DateFormat('MMMM dd, yyyy')
            .format(date); // Example: November 5, 2023
        final formattedTime = DateFormat('h:mm a').format(
          DateTime(0, 0, 0, time.hour, time.minute),
        ); // Example: 12:00 AM

        // Combine formatted date and time
        eventDateTimeController.text = '$formattedDate | $formattedTime';
      });
    }
  }

  Widget reminderToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Reminder',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: labelColor,
          ),
        ),
        Transform.scale(
          scale: 0.80,
          child: Switch(
            value: isReminder,
            onChanged: (value) {
              setState(() {
                isReminder = value;
                isPackingReminder = true;
                isRetrieveReminder = false;
              });
            },
            activeTrackColor: primaryColor,
            trackOutlineWidth: const WidgetStatePropertyAll(0),
            thumbIcon: WidgetStatePropertyAll(Icon(
              Icons.notifications,
              color: isReminder ? secondaryColor : Colors.white,
            )),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }

  Widget createReminder() {
    if (!isReminder) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          leading: Icon(
            isPackingReminder
                ? Icons.notifications_active_outlined
                : Icons.notifications_off_outlined,
            color: Colors.black,
          ),
          title: const Text('Remind me to list an items before the event.',
              style: TextStyle(color: Colors.black, fontSize: 14)),
          trailing: Transform.scale(
            scale: 0.7,
            child: Switch(
              value: isPackingReminder,
              onChanged: (value) {
                setState(() {
                  isPackingReminder = value;
                  if (!isPackingReminder && !isRetrieveReminder) {
                    isReminder = false;
                  }
                });
              },
              activeTrackColor: primaryColor,
              trackOutlineWidth: const WidgetStatePropertyAll(0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        gap(height: 10.0),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          leading: Icon(
            isRetrieveReminder
                ? Icons.notifications_active_outlined
                : Icons.notifications_off_outlined,
            color: Colors.black,
          ),
          title: const Text('Remind me to retrieve an items after the event.',
              style: TextStyle(color: Colors.black, fontSize: 14)),
          trailing: Transform.scale(
            scale: 0.7,
            child: Switch(
              value: isRetrieveReminder,
              onChanged: (value) {
                setState(() {
                  isRetrieveReminder = value;
                  if (!isPackingReminder && !isRetrieveReminder) {
                    isReminder = false;
                  }
                });
              },
              activeTrackColor: primaryColor,
              trackOutlineWidth: const WidgetStatePropertyAll(0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        )
      ],
    );
  }
}
