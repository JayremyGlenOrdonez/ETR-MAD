import 'package:flutter/material.dart';

import '../Styles/custom_colors.dart';

// Gap/Space
Widget gap({double height = 16.0, double width = 16.0}) {
  return SizedBox(height: height, width: width);
}

// Divider Line
Widget divider() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    child: Divider(
      color: Color(0xFFCACACA),
      thickness: 0.8,
    ),
  );
}

// Navigation Function
void gotoScreen(BuildContext context, {required Widget screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

// Date Picker
Future<DateTime?> pickDate(BuildContext context,
    {DateTime? initialDate}) async {
  return await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(1999),
    lastDate: DateTime(2200),
  );
}

// Time Picker
Future<TimeOfDay?> pickTime(BuildContext context,
    {TimeOfDay? initialTime}) async {
  return await showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
  );
}
