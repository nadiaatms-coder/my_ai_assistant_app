import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final String name;
  final int score;

  const ScoreCard({
    super.key,
    required this.name,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        trailing: Text("Score: $score"),
      ),
    );
  }
}