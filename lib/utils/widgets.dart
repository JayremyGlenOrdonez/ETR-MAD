import 'package:etrmad/utils/custom_tools.dart';
import 'package:flutter/material.dart';

import '../Screens/Events/create_event_screen.dart';
import '../Styles/custom_colors.dart';

Widget sectionTitle(BuildContext context, String title,
    {required IconData icon, required Color color}) {
  return Row(
    children: [
      Icon(icon, color: color),
      const SizedBox(width: 8.0),
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: labelColor,
        ),
      ),
    ],
  );
}

//CREATE BUTTON
Widget createEventButton(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [
        tertiaryColor,
        secondaryColor,
      ]),
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Side: Texts
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Event',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'Be ready for upcoming events',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
        // Right Side: Arrow Button
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  primaryColor,
                  secondaryColor,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

//REMINDER CARD
Widget reminderCard(String text) {
  return Card(
    child: ListTile(
      leading: const Icon(Icons.check_box_outline_blank, color: Colors.black),
      title: Text(text),
    ),
  );
}

// EVENT CARD
Widget eventCard({
  required String title,
  required String status,
  required int pendingItems,
}) {
  return Card(
    child: ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(Icons.event, color: Colors.black),
      ),
      title: Text(title),
      subtitle: Text('$pendingItems total items'),
      trailing: Text(
        status,
        style: const TextStyle(color: Colors.orange),
      ),
    ),
  );
}

// EVENTS DROPDOWN
Widget eventsDropDownButton(context) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      sectionTitle(
        context,
        'Events',
        icon: Icons.event,
        color: Colors.blue,
      ),
      const DropdownMenu(
        width: 140,
        textAlign: TextAlign.end,
        textStyle: TextStyle(
          color: labelColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        trailingIcon: Icon(
          Icons.arrow_drop_down,
          color: labelColor,
        ),
        menuStyle: MenuStyle(
          fixedSize: WidgetStatePropertyAll(Size(140, 200)),
        ),
        selectedTrailingIcon: Icon(
          Icons.arrow_drop_up,
          color: Colors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        initialSelection: 'all',
        dropdownMenuEntries: [
          DropdownMenuEntry(
            label: 'All',
            value: 'all',
          ),
          DropdownMenuEntry(
            label: 'Upcoming',
            value: 'upcoming',
          ),
          DropdownMenuEntry(
            label: 'Current',
            value: 'Current',
          ),
          DropdownMenuEntry(
            label: 'Ended',
            value: 'ended',
          ),
        ],
      ),
    ],
  );
}

Widget addEventButtonIcon(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: labelColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            gotoScreen(context, screen: const CreateEventScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  primaryColor,
                  secondaryColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        gap(width: 16.0),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Event',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            Text(
              'Be ready for upcoming events',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//DATE FormField

Widget dateTimeFormField(
  BuildContext context, {
  required String label,
  TextEditingController? controller,
  Function()? onTap,
}) {
  return TextFormField(
    readOnly: true,
    controller: controller,
    decoration: InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(
        fontSize: 14,
        color: labelColor,
      ),
      border: const OutlineInputBorder(),
      suffixIcon: InkWell(
        onTap: onTap,
        child: const Icon(Icons.calendar_month),
      ),
    ),
  );
}

// Text Form Field
Widget textFormField({
  required String label,
  int maxLine = 1,
  TextEditingController? controller,
}) {
  return TextFormField(
    controller: controller,
    maxLines: maxLine,
    decoration: InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(
        fontSize: 14,
        color: labelColor,
      ),
      border: const OutlineInputBorder(),
    ),
  );
}
