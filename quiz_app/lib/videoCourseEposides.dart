import 'package:flutter/material.dart';
import 'appbar.dart';
import 'videoCourseEposide.dart';

class VideoCourseEposides extends StatefulWidget {
  @override
  _VideoCourseEposidesState createState() => _VideoCourseEposidesState();
}

class _VideoCourseEposidesState extends State<VideoCourseEposides> {
  final List eposides = [1, 2, 3, 4, 5, 6, 7, 8, 9];
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
      appBar: AppBar2(),
      backgroundColor: Colors.teal,
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: eposides.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5),
            width: double.infinity,
            height: 50,
            color: Colors.teal[50],
            child: Center(
              child: RaisedButton(
                  hoverColor: Colors.teal[200],
                  child: Text(
                    'eposide ${eposides[index]}',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoCourseEposide(
                          navigateTo: VideoCourseEposides(),
                          color: Colors.black,
                          textColor: Colors.white,
                          text: Text(
                            "Back TO the course",
                          ),
                          textHeader: 'eposide ${eposides[index]}',
                          answerQuestion: _answerQuestion,
                          questionIndex: _questionIndex,
                          questions: _questions,
                          resetQuiz: _resetQuiz,
                          totalScore: _totalScore,
                        ),
                      ),
                    );
                  }),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
