import 'package:flutter/material.dart';
import '../services/leaderboard_service.dart';
import '../widgets/score_card.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = LeaderboardService.getUsers();

    return Scaffold(
      appBar: AppBar(title: const Text("Leaderboard")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ScoreCard(
            name: users[index].name,
            score: users[index].score,
          );
        },
      ),
    );
  }
}