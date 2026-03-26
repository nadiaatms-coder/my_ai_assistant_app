import 'package:flutter/material.dart';

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
    final userName =
        ModalRoute.of(context)!.settings.arguments as String;

    var currentQ = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text("Question ${currentQuestion + 1}/10"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Text(
              currentQ['question'] as String,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            ...(currentQ['answers'] as List<Map<String, Object>>)
                .map((answer) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () => answerQuestion(
                    answer['score'] as int,
                    userName,
                  ),
                  child: Text(answer['text'] as String),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}