import 'package:flutter/material.dart';
import 'answers.dart';
import 'Question.dart';
import 'package:vimeoplayer/vimeoplayer.dart';
import 'appbar.dart';
import 'button.dart';
import 'header.dart';
import 'result.dart';

class VideoCourseEposide extends StatefulWidget {
  @required
  var textHeader;
  @required
  var text;
  @required
  var navigateTo;
  @required
  var color;
  @required
  var textColor;
  VideoCourseEposide(
      {this.text,
      this.navigateTo,
      this.color,
      this.textColor,
      this.textHeader});

  @override
  _VideoCourseEposideState createState() => _VideoCourseEposideState();
}

class _VideoCourseEposideState extends State<VideoCourseEposide> {
  final questions = const [
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

  var _totalScore = 0;
  var questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) async {
    _totalScore += score;

    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.teal, //FF15162B // 0xFFF2F2F2
        appBar: MediaQuery.of(context).orientation == Orientation.portrait
            ? AppBar2()
            : PreferredSize(
                child: Container(
                  color: Colors.transparent,
                ),
                preferredSize: Size(0.0, 0.0),
              ),
        body: ListView(children: <Widget>[
          Header(widget.textHeader),
          VimeoPlayer(id: '395212534'),
          Button(
            color: Colors.white,
            textColor: Colors.black,
            navigateTo: widget.navigateTo,
            text: widget.text,
          ),
          questionIndex < questions.length
              ? Column(
                  children: [
                    Question(
                      questions[questionIndex]['questionText'],
                    ),
                    ...(questions[questionIndex]['answers']
                            as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(
                          answer: answer['text'],
                          testFunc: () {
                            setState(() {
                              _answerQuestion(answer['score']);
                            });
                          });
                    }).toList()
                  ],
                )
              : Result(_totalScore, _resetQuiz),
        ]));
  }
}
