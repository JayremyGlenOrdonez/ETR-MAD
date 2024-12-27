import 'package:etrmad/Styles/custom_colors.dart';
import 'package:etrmad/Screens/items_screen.dart';
import 'package:etrmad/Screens/Events/event_screen.dart';
import 'package:etrmad/Screens/item_tracker.dart';
import 'package:etrmad/Styles/titles.dart';
import 'package:flutter/material.dart';

import 'Styles/fonts.dart';
import 'Screens/Home/home_screen.dart';

class ScreenControls extends StatefulWidget {
  const ScreenControls({super.key});

  @override
  State<ScreenControls> createState() => _ScreenControlsState();
}

class _ScreenControlsState extends State<ScreenControls> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const EventScreen(),
    const ChecklistScreen(),
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
      drawer: drawer(),
      appBar: appBar(),
      body: bodyScreen(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  //
  // DRAWER
  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xFF85E9FF).withOpacity(0.3),
            ),
            child: Align(
              alignment: Alignment.center,
              child: ShaderMask(
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
                child: Text(
                  mainTitle.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: fontFamily,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

//
  // APP BAR
  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,

      //TITLE GRADIENT STYLE
      title: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ).createShader(bounds);
        },

        // APP TITLE
        child: const Text(
          mainTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontFamily: fontFamily,
          ),
        ),
      ),

      // NOTIFICATIONS
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  //
  // BODY SCREENS
  Widget bodyScreen() {
    return AnimatedContainer(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(16.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
      child: _screens[_selectedIndex],
    );
  }

  //
  //CUSTOM BOTTOM NAVIGATION BAR
  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(color: Colors.indigo),
      unselectedLabelStyle: const TextStyle(color: Colors.black),
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
    );
  }
}
