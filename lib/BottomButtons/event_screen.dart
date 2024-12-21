import 'package:etrmad/AddInput/Create_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:etrmad/AddInput/Menu_screen.dart'; // Ensure this import is added for MenuScreen

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Color(0xFF00A6D8), Color(0xFFA52BFB)], // Gradient colors for title
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Text(
            'Reminense',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300, // Lighter text weight
              color: Colors.white,
              fontFamily: 'Roboto', // Customize font if needed
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()), // Navigate to MenuScreen
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notification icon action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Create Event Section with Grey Background
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Light grey background
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Aligning to the left
                  children: [
                    // Left Side: Button with Gradient Background
                    InkWell(
                      onTap: () {
                        // Navigate to CreateEventScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateEventScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF0296B4), // Hex code for #0296B4
                              Color(0xFF8F00C3), // Hex code for #8F00C3
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add, // Add icon
                          color: Colors.white, // White icon to contrast with the gradient background
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0), // Space between button and text
                    // Left Side: Texts
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Event',
                          style: TextStyle(
                            color: Colors.black, 
                            fontSize: 18, 
                            fontWeight: FontWeight.bold, // Bold text
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Be ready for upcoming events',
                          style: TextStyle(
                            color: Colors.grey, // Grey color for the second text
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0), // Space between "Create Event" and the next section

            // Events Section with "Events" text on left and "All >" text on right
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Events',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14, // Same font size as "Be ready for upcoming events"
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'All',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14, // Same font size as "Be ready for upcoming events"
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey, // Downward arrow
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0), // Space between "Events" section and the next content

            // Additional content (like reminders, events, etc.) can be added here
            Center(
              child: Text('Event Screen', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
