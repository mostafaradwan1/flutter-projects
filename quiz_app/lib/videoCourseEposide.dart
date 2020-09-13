import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/loading.dart';

import 'package:quiz_app/providers/questionsProvider.dart';
import 'answers.dart';
import 'Question.dart';
import 'package:vimeoplayer/vimeoplayer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'appbar.dart';
import 'button.dart';
import 'header.dart';
import 'result.dart';
import 'error.dart';

var db = FirebaseFirestore.instance;

class VideoCourseEposide extends StatefulWidget {
  static var routeName = '/eposide';

  final textHeader;
  final text;
  final navigateTo;
  final color;
  final textColor;
  final courseId;
  VideoCourseEposide(
      {this.text,
      this.navigateTo,
      this.color,
      this.textColor,
      this.textHeader,
      this.courseId});

  @override
  _VideoCourseEposideState createState() => _VideoCourseEposideState();
}

@override
class _VideoCourseEposideState extends State<VideoCourseEposide> {
  Future<DocumentSnapshot> futurevar;
  Future<DocumentSnapshot> getdatamethod() {
    return courses
        .doc(widget.courseId)
        .collection("Lessons")
        .doc(widget.textHeader)
        .get();
  }

  CollectionReference courses =
      FirebaseFirestore.instance.collection('courses');

  var count = 0;
  var questionsAndANswers;

  @override
  void initState() {
    courses
        .doc(widget.courseId)
        .collection("Lessons")
        .doc(widget.textHeader)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        print(widget.textHeader);
        print(widget.courseId);

        // print(questions);

        count = documentSnapshot.data()['questionsCount'];
        questionsAndANswers = documentSnapshot.data()['questions'];
        print(questionsAndANswers);
      }
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    // final quizData = Provider.of<QuizProvider>(context);
    return FutureBuilder<DocumentSnapshot>(
      future: courses
          .doc(widget.courseId)
          .collection("Lessons")
          .doc(widget.textHeader)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Error();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          final quizData = Provider.of<QuizProvider>(context);
          Map<String, dynamic> data = snapshot.data.data();
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
                          ...(questionsAndANswers[quizData.questionIndex]
                                  ['answers'])
                              .map((answer) {
                            return Answer(
                                answer: answer,
                                testFunc: () => quizData.answerQuestion);
                          }).toList()
                        ],
                      )
                    : Result(0, quizData.resetQuiz)
              ]));
        }

        return Loading();
      },
    );
  }
}
