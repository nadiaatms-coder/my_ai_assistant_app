import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/dashboard.dart';
import 'screens/leaderboard.dart';
import 'screens/quiz.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Quiz Game',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
      ),

      home: const WelcomeScreen(),

      routes: {
        '/dashboard': (context) => const Dashboard(),
        '/quiz': (context) => QuizScreen(),
        '/result': (context) => const ResultScreen(),
        '/leaderboard': (context) => const LeaderboardScreen(),
      },
    );
  }
}