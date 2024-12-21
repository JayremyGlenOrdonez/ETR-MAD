import 'package:etrmad/BottomButtons/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(EtrMad());
}

class EtrMad extends StatelessWidget {
   EtrMad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}