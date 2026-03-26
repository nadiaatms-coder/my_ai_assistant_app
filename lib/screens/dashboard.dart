import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final userName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Hi, $userName 👋",
                style: const TextStyle(fontSize: 22)),

            const SizedBox(height: 10),

            const Text(
              "Welcome to our game board.\nThis game is to know your competencies in IT.",
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/quiz',
                  arguments: userName,
                );
              },
              child: const Text("Start Quiz"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/leaderboard');
              },
              child: const Text("Leaderboard"),
            ),
          ],
        ),
      ),
    );
  }
}