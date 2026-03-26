import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/leaderboard_service.dart';
import '../widgets/space_background.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isSaved = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!isSaved) {
      final data = ModalRoute.of(context)!.settings.arguments as Map;
      String name = data['name'];
      int score = data['score'];

      LeaderboardService.addUser(User(name: name, score: score));
      isSaved = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    String name = data['name'];
    int score = data['score'];

    return Scaffold(
      body: SpaceBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🎉 $name, Your Score: $score",
                style: const TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                child: const Text("Play Again"),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/leaderboard');
                },
                child: const Text("View Leaderboard"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}