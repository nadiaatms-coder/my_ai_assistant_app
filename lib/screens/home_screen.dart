import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../services/ai_service.dart';
import '../widgets/chat_bubble.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [
    Message(text: 'Halo! Aku AI Studio Assistant kamu.', isUser: false)
  ];

  String selectedSubject = 'Informatika';
  List<String> subjects = [
    'Matematika',
    'Informatika',
    'IPA',
    'IPS',
    'Coding',
    'Lainnya'
  ];

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add(Message(text: text, isUser: true));
      messages.addAll(AIService.getAnswer(text, selectedSubject));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('AI Studio Assistant'),
        backgroundColor: Color(0xFF6A1B9A), // ungu
      ),
      body: Column(
        children: [
          // Dropdown & default questions
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedSubject,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value!;
                      });
                    },
                    items: subjects
                        .map((subject) => DropdownMenuItem(
                              value: subject,
                              child: Text(subject),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(width: 8),
                PopupMenuButton<String>(
                  icon: Icon(Icons.question_answer, color: Colors.blue[800]),
                  onSelected: (question) {
                    sendMessage(question);
                  },
                  itemBuilder: (context) {
                    return AIService.defaultQuestions[selectedSubject]!
                        .map((q) => PopupMenuItem(
                              value: q,
                              child: Text(q),
                            ))
                        .toList();
                  },
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          // Chat messages
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: messages[index]);
              },
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          // Input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tulis pertanyaanmu...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: Colors.grey[100],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A1B9A), // ungu
                  ),
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}