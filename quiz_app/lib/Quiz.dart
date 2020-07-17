import 'package:flutter/material.dart';
import 'Question.dart';
import 'answers.dart';
import 'result.dart';
import 'appbar.dart';

class Quiz extends StatefulWidget {
  // final List<Map<String, Object>> questions;
  // final int questionIndex;
  // final int totalScore;
  // final Function answerQuestion;
  // final Function resetQuiz;

  // Quiz({
  //   @required this.questions,
  //   @required this.answerQuestion,
  //   @required this.questionIndex,
  //   @required this.totalScore,
  //   @required this.resetQuiz,
  // });
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
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

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: defualtAppBar,
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
                        answer['text'], () => _answerQuestion(answer['score']));
                  }).toList()
                ],
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

// class Quiz extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return questionIndex < questions.length
//         ? Column(children: [
//             Question(
//               questions[questionIndex]['questionText'],
//             ),
//             ...(questions[questionIndex]['answers']
//                     as List<Map<String, Object>>)
//                 .map((e) {
//               return Answer(e['text'], () => answerQuestion(e['score']));
//             }).toList()
//           ])
//         : Result(totalScore, resetQuiz);
//   }
// }
