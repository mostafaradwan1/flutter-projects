import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/questionsProvider.dart';

import 'Question.dart';
import 'answers.dart';
import 'result.dart';
import 'appbar.dart';
import 'header.dart';

class Quiz extends StatefulWidget {
  static var routeName = '/quiz';

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    final quizData = Provider.of<QuizProvider>(context);
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar2(), //AppBarr(),
      body: quizData.questionIndex < quizData.questions.length
          ? Column(
              children: [
                Header("Quiz"),
                Question(
                  quizData.questions[quizData.questionIndex]['questionText'],
                ),
                ...(quizData.questions[quizData.questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(
                      answer: answer['text'],
                      testFunc: () => quizData.answerQuestion(answer['score']));
                }).toList()
              ],
            )
          : ChangeNotifierProvider(
              create: (context) => QuizProvider(),
              child: Result(quizData.totalScore, quizData.resetQuiz)),
    );
  }
}
