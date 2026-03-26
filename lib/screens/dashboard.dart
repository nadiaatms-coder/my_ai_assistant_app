import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SpaceBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, $userName 👋",
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome to our game board.\nThis game is to know your competencies in IT.",
                  style: TextStyle(color: Colors.white70),
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
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/leaderboard');
                  },
                  child: const Text("Leaderboard"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}