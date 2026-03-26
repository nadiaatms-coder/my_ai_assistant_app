import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/leaderboard_service.dart';
import '../widgets/space_background.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String getAIAnalysis(int score) {
    if (score == 100) {
      return "🔥 Excellent! You have very strong IT basic knowledge.\n\nYou are highly suitable for:\n• Frontend Developer\n• Mobile App Developer\n• Software Engineer\n\nKeep improving and start building real projects 🚀";
    } else if (score >= 80) {
      return "🚀 Great job! You understand IT concepts very well.\n\nYou may be suitable for:\n• Frontend Developer\n• UI/UX Developer\n• Mobile Developer\n\nYou already have a strong foundation!";
    } else if (score >= 60) {
      return "💡 Good effort! You already know some important IT basics.\n\nYou may fit roles like:\n• Junior Web Developer\n• IT Support\n• Beginner App Developer\n\nKeep practicing HTML, CSS, Flutter, and APIs.";
    } else if (score >= 40) {
      return "📘 Not bad! You are still learning the basics of IT.\n\nSuggested focus:\n• Learn frontend basics\n• Understand backend concepts\n• Practice coding every day\n\nYou're on the right path 💪";
    } else {
      return "🌱 Beginner level detected.\n\nNo worries — this is just the start!\n\nRecommended learning path:\n• What is coding?\n• HTML & CSS\n• Flutter basics\n• Git & GitHub\n\nKeep learning step by step 🚀";
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    String name = data['name'];
    int score = data['score'];

    LeaderboardService.addUser(User(name: name, score: score));

    final aiAnalysis = getAIAnalysis(score);

    return Scaffold(
      body: SpaceBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "🎉 Great Job, $name!",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Your Score: $score / 100",
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "🤖 AI Skill Analysis",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            aiAnalysis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (route) => false,
                          );
                        },
                        child: const Text("Play Again"),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/leaderboard');
                        },
                        child: const Text("View Leaderboard"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}