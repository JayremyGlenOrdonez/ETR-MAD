import 'package:etrmad/AddInput/Add_item_screen.dart';
import 'package:etrmad/AddInput/Menu_screen.dart';
import 'package:flutter/material.dart';

class ChecklistScreen extends StatelessWidget {
  const ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // List an Item Section with Grey Background
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Light grey background
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Aligning to the left
                children: [
                  // Left Side: Button with Gradient Background
                  InkWell(
                    onTap: () {
                      // Navigate to the AddItemScreen when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddItemScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF0296B4), // Hex code for #0296B4
                            Color(0xFF8F00C3), // Hex code for #8F00C3
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.add, // Add icon
                        color: Colors
                            .white, // White icon to contrast with the gradient background
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0), // Space between button and text
                  // Left Side: Texts
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'List an Item',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Always remember your things',
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
          const SizedBox(
              height:
                  16.0), // Space between "List an Item" and the next section

          // Item List Section with "Item List" text on left and "All >" text on right
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Item List',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize:
                        14, // Same font size as "Always remember your things"
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'All',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize:
                            14, // Same font size as "Always remember your things"
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
          const SizedBox(
              height:
                  16.0), // Space between "Item List" section and the next content

          // Additional content (like reminders, item list, etc.) can be added here
          const Center(
            child: Text('Item Screen', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
