import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/leaderboard_service.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map;

    String name = data['name'];
    int score = data['score'];

    LeaderboardService.addUser(User(name: name, score: score));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("🎉 Your Score: $score",
                style: const TextStyle(fontSize: 22)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Text("Play Again"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/leaderboard');
              },
              child: const Text("View Leaderboard"),
            ),
          ],
        ),
      ),
    );
  }
}