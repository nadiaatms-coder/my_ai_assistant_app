import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameController = TextEditingController();

  String aiMessage = "Hi 👋 I'm your AI assistant! Ready to play?";

  void startGame() {
    if (nameController.text.isEmpty) return;

    Navigator.pushNamed(
      context,
      '/dashboard',
      arguments: nameController.text,
    );
  }

  void askAI() {
    setState(() {
      aiMessage = "Great! I will analyze your IT skills later 🚀";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "🎮 Let's Play!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: startGame,
              child: const Text("Start Game"),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [BoxShadow(blurRadius: 5)],
              ),
              child: Column(
                children: [
                  Text(aiMessage),
                  TextButton(
                    onPressed: askAI,
                    child: const Text("Ask AI 🤖"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}