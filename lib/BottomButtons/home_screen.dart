import 'package:etrmad/BottomButtons/items_screen.dart';
import 'package:etrmad/BottomButtons/event_screen.dart';
import 'package:etrmad/BottomButtons/item_tracker.dart';
import 'package:etrmad/AddInput/Create_event_screen.dart';
import 'package:etrmad/AddInput/Menu_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreenContent(),
    EventScreen(),
    ChecklistScreen(),
    ItemTrackerScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.indigo),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Item Tracker',
          ),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppBar Section
          AppBar(
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
                  fontFamily: 'Robonto',
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuScreen()),
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

          // Create Event Row with Gradient Background
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF8F00C3),
                  Color(0xFFB50061),
                ]),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Side: Texts
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Event',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
                    onTap: () {
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
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Reminders Section
          _buildSectionTitle(
            context,
            'Reminders',
            icon: Icons.alarm,
            color: Colors.orange,
          ),
          _buildRemindersList(),

          // ** Partition Line Adjustment ** - Here is where you can adjust the partition line
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Increased vertical space
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width here
              height: 1.0, // Line thickness
              color: Colors.grey[300], // Line color
            ),
          ),

          // Current Events Section
          _buildSectionTitle(
            context,
            'Current Events',
            icon: Icons.event_note,
            color: Colors.blue,
          ),
          _buildEventCard(
            title: 'Camping',
            status: 'Retrieving',
            pendingItems: 4,
          ),

          // Upcoming Events Section
          _buildSectionTitle(
            context,
            'Upcoming Events',
            icon: Icons.upcoming,
            color: Colors.green,
          ),
          _buildEventCard(
            title: 'Swimming',
            status: 'Planned',
            pendingItems: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, {required IconData icon, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildRemindersList() {
    return Column(
      children: [
        _buildReminderCard("Don’t forget to pack the speaker for Jessica’s Wedding tomorrow."),
        _buildReminderCard("Return fairy lights to Michael by Dec 20."),
        _buildReminderCard("Mark all items retrieved for Emily’s Party."),
      ],
    );
  }

  Widget _buildReminderCard(String text) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        leading: Icon(Icons.check_box_outline_blank, color: Colors.black),
        title: Text(text),
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String status,
    required int pendingItems,
  }) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(Icons.event, color: Colors.black),
            ),
            title: Text(title),
            subtitle: Text('$pendingItems pending items'),
            trailing: Text(
              status,
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ),
        Divider(color: Colors.grey[300], thickness: 1.0), // Partition Line at the bottom of the card
      ],
    );
  }
}
