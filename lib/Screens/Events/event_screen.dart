import 'package:etrmad/utils/custom_tools.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets.dart'; // Ensure this import is added for MenuScreen

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          addEventButtonIcon(context),
          gap(height: 16.0),
          eventsDropDownButton(context),
        ],
      ),
    );
  }
}
