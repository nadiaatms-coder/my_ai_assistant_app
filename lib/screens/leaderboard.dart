import 'package:flutter/material.dart';
import '../services/leaderboard_service.dart';
import '../widgets/score_card.dart';
import '../widgets/space_background.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = LeaderboardService.getUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SpaceBackground(
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ScoreCard(
                name: users[index].name,
                score: users[index].score,
              );
            },
          ),
        ),
      ),
    );
  }
}