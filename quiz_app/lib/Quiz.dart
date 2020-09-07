import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/questionsProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Question.dart';
import 'answers.dart';
import 'result.dart';
import 'appbar.dart';
import 'header.dart';

var db = FirebaseFirestore.instance;

class Quiz extends StatefulWidget {
  static var routeName = '/quiz';

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // var lessonsArray = [];
  var count = 0;
  var questionsAndANswers;
  getCCourse() async {
    var cLessons =
        db.collection('courses').doc('C Course').collection('Lessons');
    cLessons.get().then((snap) {
      snap.docs.forEach((doc) {
        setState(() {
          questionsAndANswers = doc.data()['questions'];
          count = doc.data()['questionsCount'];
        });
        // use set state
      });
    });
  }

  @override
  void initState() {
    getCCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final quizData = Provider.of<QuizProvider>(context);
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar2(), //AppBarr(),
      body: quizData.questionIndex < count
          ? Column(
              children: [
                Header("Quiz"),
                Question(
                  questionsAndANswers[quizData.questionIndex]['questionText'],
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
    );
  }

  // courses.doc('C').snapshots().forEach((element) {
  //   print(element.data());
  // });

  // return FutureBuilder<DocumentSnapshot>(
  //   future: courses.doc("C").get(),
  //   builder:
  //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //     if (snapshot.hasError) {
  //       return Text("Something went wrong");
  //     }

  //     if (snapshot.connectionState == ConnectionState.done) {
  //       Map<String, dynamic> data = snapshot.data.data();
  //       return Column(
  //         children: [
  //           data.
  //         ],
  //       );
  //     }

  //     return Text("loading");
  //   },
  // );
  //}
}
