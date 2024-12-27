import 'package:etrmad/_screen_controls.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EtrMad());
}

class EtrMad extends StatelessWidget {
  const EtrMad({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenControls(),
    );
  }
}
