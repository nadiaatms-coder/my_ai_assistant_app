import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    final userName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text("Flutter is...?"),

            ElevatedButton(
              onPressed: () {
                score += 10;
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {
                    'name': userName,
                    'score': score,
                  },
                );
              },
              child: const Text("Framework"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {
                    'name': userName,
                    'score': score,
                  },
                );
              },
              child: const Text("Game"),
            ),
          ],
        ),
      ),
    );
  }
}