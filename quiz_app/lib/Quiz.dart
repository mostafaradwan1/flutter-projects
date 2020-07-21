import 'package:flutter/material.dart';
import 'Question.dart';
import 'answers.dart';
import 'result.dart';
import 'appbar.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 0},
        {'text': 'Red', 'score': 0},
        {'text': 'Green', 'score': 0},
        {'text': 'White', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 0},
        {'text': 'Snake', 'score': 0},
        {'text': 'Elephant', 'score': 0},
        {'text': 'Lion', 'score': 0},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Eng-Abdulrahman', 'score': 1},
        {'text': 'Eng-Abdulrahman', 'score': 1},
        {'text': 'Eng-Abdulrahman', 'score': 1},
        {'text': 'Eng-Abdulrahman', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) async {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar2(), //AppBarr(),
      body: _questionIndex < _questions.length
          ? Column(
              children: [
                Question(
                  _questions[_questionIndex]['questionText'],
                ),
                ...(_questions[_questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(
                      answer: answer['text'],
                      testFunc: () => _answerQuestion(answer['score']));
                }).toList()
              ],
            )
          : Result(_totalScore, _resetQuiz),
    );
  }
}
