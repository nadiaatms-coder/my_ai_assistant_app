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
  final ScrollController scrollController = ScrollController();

  final List<Map<String, String>> messages = [
    {
      "sender": "ai",
      "text": "Hi 👋 I'm your AI assistant! Ask me anything about IT 🚀"
    }
  ];

  bool isTyping = false;

  void startGame() {
    if (nameController.text.isEmpty) return;

    Navigator.pushNamed(
      context,
      '/dashboard',
      arguments: nameController.text,
    );
  }

  Future<void> sendMessage() async {
    String question = chatController.text.trim();
    if (question.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "text": question});
      isTyping = true;
    });

    chatController.clear();
    scrollToBottom();

    await Future.delayed(const Duration(milliseconds: 700));

    String aiReply = getAIReply(question);

    setState(() {
      messages.add({"sender": "ai", "text": aiReply});
      isTyping = false;
    });

    scrollToBottom();
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String getAIReply(String question) {
    String q = question.toLowerCase();

    if (q.contains("flutter")) {
      return "Flutter is a UI framework made by Google. It is used to build mobile, web, and desktop apps using one codebase.";
    } 
    else if (q.contains("dart")) {
      return "Dart is the programming language used in Flutter. It is easy to learn and good for building apps.";
    } 
    else if (q.contains("html")) {
      return "HTML stands for HyperText Markup Language. It is used to create the structure of web pages.";
    } 
    else if (q.contains("css")) {
      return "CSS is used to style websites, such as colors, layout, fonts, and spacing.";
    } 
    else if (q.contains("javascript")) {
      return "JavaScript is a programming language used to make websites interactive.";
    } 
    else if (q.contains("react")) {
      return "React is a JavaScript library used to build user interfaces, especially for websites.";
    } 
    else if (q.contains("mysql")) {
      return "MySQL is a database system used to store and manage data.";
    } 
    else if (q.contains("api")) {
      return "API stands for Application Programming Interface. It allows two applications to communicate with each other.";
    } 
    else if (q.contains("git")) {
      return "Git is a version control system. It helps developers track code changes and work together.";
    } 
    else if (q.contains("frontend")) {
      return "Frontend is the part of a website or app that users can see and interact with.";
    } 
    else if (q.contains("backend")) {
      return "Backend is the behind-the-scenes part of an app. It handles servers, databases, and logic.";
    } 
    else if (q.contains("database")) {
      return "A database is a place to store data, such as user information, scores, or app content.";
    } 
    else if (q.contains("python")) {
      return "Python is a popular programming language used for web development, AI, automation, and data science.";
    } 
    else if (q.contains("java")) {
      return "Java is a programming language often used for Android apps, backend systems, and software development.";
    } 
    else if (q.contains("what is coding") || q.contains("coding")) {
      return "Coding means writing instructions for a computer so it can perform tasks.";
    } 
    else if (q.contains("who are you")) {
      return "I'm your mini AI assistant 🤖 I can help explain IT topics in a simple way.";
    } 
    else if (q.contains("hello") || q.contains("hi")) {
      return "Hello there 👋 Ask me anything about coding, apps, websites, or IT!";
    } 
    else if (q.contains("thank")) {
      return "You're welcome 😄 Keep learning and keep building cool stuff!";
    } 
    else {
      return "Hmm 🤔 I don't fully understand that yet.\nTry asking about Flutter, Dart, HTML, CSS, API, Git, Frontend, Backend, Database, or Coding.";
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    chatController.dispose();
    scrollController.dispose();
    super.dispose();
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
                            controller: scrollController,
                            itemCount: messages.length + (isTyping ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (isTyping && index == messages.length) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 6),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Text(
                                      "AI is typing...",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                );
                              }

                              final msg = messages[index];
                              final isUser = msg["sender"] == "user";

                              return Align(
                                alignment: isUser
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 6),
                                  padding: const EdgeInsets.all(12),
                                  constraints: const BoxConstraints(maxWidth: 280),
                                  decoration: BoxDecoration(
                                    color: isUser
                                        ? Colors.blueAccent.withOpacity(0.8)
                                        : Colors.white.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    msg["text"]!,
                                    style: const TextStyle(color: Colors.white),
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
                                onSubmitted: (_) => sendMessage(),
                                decoration: InputDecoration(
                                  hintText: "Ask something...",
                                  hintStyle: const TextStyle(color: Colors.white54),
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