import 'package:etrmad/Database/db_helper.dart';
import 'package:etrmad/Screens/Events/event_view.dart';
import 'package:etrmad/Styles/custom_colors.dart';
import 'package:etrmad/controller/event_controller.dart';
import 'package:etrmad/models/event_model.dart';
import 'package:etrmad/models/item_model.dart';
import 'package:etrmad/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_tools.dart';

class ItemRetrieveScreen extends StatefulWidget {
  ItemRetrieveScreen({super.key, required this.event});
  Event event;
  @override
  State<ItemRetrieveScreen> createState() => _ItemRetrieveScreenState();
}

class _ItemRetrieveScreenState extends State<ItemRetrieveScreen> {
  var controller = Get.put(EventController());

  @override
  void initState() {
    items = widget.event.items;
    super.initState();
  }

  List<Items> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Retrieve Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                      child: ListTile(
                    leading: Checkbox(
                        value: items[index].isReturned,
                        onChanged: (value) {
                          setState(() {
                            items[index].isReturned = value!;
                          });
                        }),
                    title: Text(items[index].name ?? 'N/A'),
                    trailing: Text('${items[index].quantity} Items'),
                  )),
                );
              },
            ),
            gap(height: 12.0),
            Row(
              children: [
                MaterialButton(
                  textColor: Colors.white,
                  color: primaryColor,
                  onPressed: () async {
                    widget.event.items = items;
                    var event =
                        await DbHelper.instance.updateEvent(widget.event);

                    gotoScreenReplacement(context,
                        screen: EventViewScreen(event: event));
                    controller.refresh();
                  },
                  child: const Text('Update Event'),
                ),

                //
                gap(width: 12.0),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () async {
                    widget.event.items = items;
                    widget.event.status = 'Ended';
                    var event =
                        await DbHelper.instance.updateEvent(widget.event);

                    gotoScreenReplacement(context,
                        screen: EventViewScreen(event: event));
                    controller.refresh();
                  },
                  child: const Text('End Event'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
