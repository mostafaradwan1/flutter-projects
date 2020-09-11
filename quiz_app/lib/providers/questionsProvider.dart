import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/Quiz.dart';

var db = FirebaseFirestore.instance;

class GetCourses extends StatelessWidget {
  final String documentId;

  GetCourses(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference courses = FirebaseFirestore.instance.collection('courses');

    return FutureBuilder<DocumentSnapshot>(
      future: courses.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
class QuizProvider with ChangeNotifier {
    CollectionReference courses = FirebaseFirestore.instance.collection('courses');
  
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

  List<Map<String, Object>> get questions {
    return _questions;
  }

  int get questionIndex {
    return _questionIndex;
  }

  int get totalScore {
    return _totalScore;
  }

  void resetQuiz() {
    _questionIndex = 0;
    _totalScore = 0;
    ChangeNotifier();
  }

  void answerQuestion(int score) async {
    _totalScore += score;
    _questionIndex = _questionIndex + 1;
    ChangeNotifier();
  }
}
