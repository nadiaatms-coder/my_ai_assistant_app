import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyAssistantApp());
}

class MyAssistantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Studio Assistant',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}