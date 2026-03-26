import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController chatController = TextEditingController();

  final List<Map<String, String>> messages = [
    {
      "sender": "ai",
      "text": "Hi 👋 I'm your AI assistant! Ask me anything about IT 🚀"
    }
  ];

  void startGame() {
    if (nameController.text.isEmpty) return;

    Navigator.pushNamed(
      context,
      '/dashboard',
      arguments: nameController.text,
    );
  }

  void sendMessage() {
    String question = chatController.text.trim();
    if (question.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "text": question});
    });

    String aiReply = getAIReply(question);

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        messages.add({"sender": "ai", "text": aiReply});
      });
    });

    chatController.clear();
  }

  String getAIReply(String question) {
    String q = question.toLowerCase();

    if (q.contains("flutter")) {
      return "Flutter is a UI framework by Google used to build mobile, web, and desktop apps.";
    } else if (q.contains("dart")) {
      return "Dart is the programming language used by Flutter.";
    } else if (q.contains("html")) {
      return "HTML stands for HyperText Markup Language.";
    } else if (q.contains("css")) {
      return "CSS is used for styling web pages.";
    } else if (q.contains("api")) {
      return "API means Application Programming Interface.";
    } else if (q.contains("git")) {
      return "Git is a version control system used by developers.";
    } else if (q.contains("mysql")) {
      return "MySQL is a database management system.";
    } else if (q.contains("react")) {
      return "React is a JavaScript library for building user interfaces.";
    } else if (q.contains("backend")) {
      return "Backend handles server, database, and application logic.";
    } else if (q.contains("frontend")) {
      return "Frontend is the part of an app or website users interact with.";
    } else {
      return "Interesting question 👀\nI'm still a simple AI for now, but I can help with basic IT topics!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                  "🎮 Let's Play!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Enter your name",
                    labelStyle: const TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: startGame,
                  child: const Text("Start Game"),
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "🤖 AI Chat Assistant",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Expanded(
                          child: ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final msg = messages[index];
                              final isUser = msg["sender"] == "user";

                              return Align(
                                alignment: isUser
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  padding: const EdgeInsets.all(12),
                                  constraints: const BoxConstraints(
                                    maxWidth: 280,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isUser
                                        ? Colors.blueAccent.withOpacity(0.8)
                                        : Colors.white.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    msg["text"]!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: chatController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Ask something...",
                                  hintStyle: const TextStyle(
                                    color: Colors.white54,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.08),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: sendMessage,
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}