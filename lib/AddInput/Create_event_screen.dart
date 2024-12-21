import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Ensures the back button is visible
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
            'Create Event',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300, // Lighter text weight
              color: Colors.white,
              fontFamily: 'Roboto', // Customize font if needed
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.black), // Save icon on the right
            onPressed: () {
              // Implement save functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0), // Space between AppBar and TabBar
          DefaultTabController(
            length: 2, // Number of tabs
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black, // Active tab label color
                  unselectedLabelColor: Colors.grey, // Inactive tab label color
                  indicatorColor: Color(0xFF00A6D8), // Underline color for selected tab
                  tabs: [
                    Tab(text: 'Details'),
                    Tab(text: 'Item List'),
                  ],
                ),
                Container(
                  height: 400.0, // Just for demo, adjust based on content
                  child: TabBarView(
                    children: [
                      Center(child: Text('Details Content')), // Placeholder for Details content
                      Center(child: Text('Item List Content')), // Placeholder for Item List content
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
