import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/providers/questionsProvider.dart';
import 'answers.dart';
import 'Question.dart';
import 'package:vimeoplayer/vimeoplayer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'appbar.dart';
import 'button.dart';
import 'header.dart';
import 'result.dart';

var db = FirebaseFirestore.instance;

class VideoCourseEposide extends StatefulWidget {
  static var routeName = '/eposide';

  @required
  final textHeader;
  @required
  final text;
  @required
  final navigateTo;
  @required
  final color;
  @required
  final textColor;
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
  @override
  var count = 0;
  var questionsAndANswers;
  var lessonsQuestions = [];
  var cLessons = db.collection('courses').doc('C Course').collection('Lessons');
  getCCourse() async {
    cLessons.doc(widget.textHeader).get().then((snap) {
      setState(() {
        questionsAndANswers = snap.data()['questions'];
        count = snap.data()['questionsCount'];
        // use set state
        print(lessonsQuestions);
      });
    });
  }

  @override
  void initState() {
    getCCourse();
    super.initState();
  }

  Widget build(BuildContext context) {
    final quizData = Provider.of<QuizProvider>(context);
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
          quizData.questionIndex < count
              ? Column(
                  children: [
                    Header("Quiz"),
                    Question(
                      questionsAndANswers[quizData.questionIndex]
                          ['questionText'],
                    ),
                    ...(questionsAndANswers[quizData.questionIndex]['answers']
                            as List)
                        .map((answer) {
                      return Answer(
                          answer: answer,
                          testFunc: () => quizData.answerQuestion(0));
                    }).toList()
                  ],
                )
              : ChangeNotifierProvider(
                  create: (context) => QuizProvider(),
                  child: Result(quizData.totalScore, quizData.resetQuiz)),
        ]));
  }
}
