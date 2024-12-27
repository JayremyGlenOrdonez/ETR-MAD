import 'package:etrmad/utils/custom_tools.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reminders Section
          sectionTitle(
            context,
            'Reminders',
            icon: Icons.alarm,
            color: Colors.deepOrange,
          ),
          gap(height: 10.0),
          _buildRemindersList(),

          gap(height: 20.0),
          divider(),
          gap(height: 20.0),

          // Current Events Section
          sectionTitle(
            context,
            'Current Events',
            icon: Icons.event_note,
            color: Colors.blue,
          ),
          gap(height: 10.0),
          eventCard(
            title: 'Camping',
            status: 'Retrieving',
            pendingItems: 4,
          ),

          gap(height: 20.0),
          divider(),
          gap(height: 20.0),
          // Upcoming Events Section
          sectionTitle(
            context,
            'Upcoming Events',
            icon: Icons.upcoming,
            color: Colors.green,
          ),
          _buildEventsList(),
        ],
      ),
    );
  }

  Widget _buildRemindersList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        reminderCard(
          "Don’t forget to pack the speaker for Jessica’s Wedding tomorrow.",
        ),
        reminderCard("Return fairy lights to Michael by Dec 20."),
        reminderCard("Mark all items retrieved for Emily’s Party."),
      ],
    );
  }

  Widget _buildEventsList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        eventCard(
          title: 'Hiking',
          status: 'Planned',
          pendingItems: 4,
        ),
        eventCard(
          title: 'Swimming',
          status: 'Planned',
          pendingItems: 2,
        ),
      ],
    );
  }
}
