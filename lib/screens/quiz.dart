import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  final List<Map<String, Object>> questions = [
    {
      'question': 'Flutter is...?',
      'answers': [
        {'text': 'Framework', 'score': 10},
        {'text': 'Game', 'score': 0},
      ],
    },
    {
      'question': 'Dart is...?',
      'answers': [
        {'text': 'Programming Language', 'score': 10},
        {'text': 'Database', 'score': 0},
      ],
    },
    {
      'question': 'HTML stands for...?',
      'answers': [
        {'text': 'HyperText Markup Language', 'score': 10},
        {'text': 'HighText Machine Language', 'score': 0},
      ],
    },
    {
      'question': 'CSS is used for...?',
      'answers': [
        {'text': 'Styling', 'score': 10},
        {'text': 'Programming', 'score': 0},
      ],
    },
    {
      'question': 'Which one is mobile framework?',
      'answers': [
        {'text': 'Flutter', 'score': 10},
        {'text': 'MySQL', 'score': 0},
      ],
    },
    {
      'question': 'Which is database?',
      'answers': [
        {'text': 'MySQL', 'score': 10},
        {'text': 'Flutter', 'score': 0},
      ],
    },
    {
      'question': 'Git is used for...?',
      'answers': [
        {'text': 'Version Control', 'score': 10},
        {'text': 'Design', 'score': 0},
      ],
    },
    {
      'question': 'API stands for...?',
      'answers': [
        {'text': 'Application Programming Interface', 'score': 10},
        {'text': 'Advanced Program Input', 'score': 0},
      ],
    },
    {
      'question': 'Which is frontend?',
      'answers': [
        {'text': 'React', 'score': 10},
        {'text': 'Node.js', 'score': 0},
      ],
    },
    {
      'question': 'Which is backend?',
      'answers': [
        {'text': 'Node.js', 'score': 10},
        {'text': 'Flutter', 'score': 0},
      ],
    },
  ];

  void answerQuestion(int scoreValue, String userName) {
    score += scoreValue;

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      Navigator.pushNamed(
        context,
        '/result',
        arguments: {
          'name': userName,
          'score': score,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;

    var currentQ = questions[currentQuestion];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Question ${currentQuestion + 1}/10"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SpaceBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    currentQ['question'] as String,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ...(currentQ['answers'] as List<Map<String, Object>>).map((answer) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => answerQuestion(
                        answer['score'] as int,
                        userName,
                      ),
                      child: Text(
                        answer['text'] as String,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}