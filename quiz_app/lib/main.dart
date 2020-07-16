import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText':
          'كم عدد الدروس القادمة الخاصة بطريقة التفكير السليمة لأي رائد الأعمال',
      'answers': [
        {'text': '10', 'score': 1},
        {'text': '11', 'score': 0},
        {'text': '12', 'score': 0},
        {'text': '14', 'score': 0},
      ],
    },
    {
      'questionText': 'تغيير طريقة التفكير هو أمر شاق، لذا يجب عليك',
      'answers': [
        {'text': 'ان تشاهد ما تشاء من الدروس طالما انك تفهم', 'score': 3},
        {'text': 'yes', 'score': 11},
        {'text': 'yes', 'score': 5},
        {'text': 'yes', 'score': 9},
      ],
    },
    {
      'questionText':
          'تلكي تفهم المحتوي يجب أن يكون هدفك الأساسي هو إنشاء شركة كبيرة دخلها السنوي مليار دولار أو أكثر',
      'answers': [
        {'text': 'yes', 'score': 0},
        {'text': 'no', 'score': 1},
      ],
    },
    {
      'questionText':
          'تغيير طريقة التفكير أمر شاق وإستيعاب المعلومات التي في الدروس لا يعني إطلاقا أن طريقة تفكيرك بدأت في التغيير',
      'answers': [
        {'text': 'yes', 'score': 1},
        {'text': 'yes', 'score': 1},
        {'text': 'yes', 'score': 1},
        {'text': 'yes', 'score': 1},
      ],
    },
    {
      'questionText':
          'تغيير طريقة التفكير أمر شاق وإستيعاب المعلومات التي في الدروس لا يعني إطلاقا أن طريقة تفكيرك بدأت في التغيير',
      'answers': [
        {'text': '10', 'score': 1},
        {'text': '10', 'score': 1},
        {'text': '10', 'score': 1},
        {'text': '10', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override //(to make clear you are not accedently override ) not required decorator provided by flutter to make code cleaner
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.teal,
          appBar: AppBar(
            leading: IconButton(
              padding: EdgeInsets.all(5.0),
              icon: Image.asset('images/logo.png'),
              onPressed: null,
            ),
            title: Text(
              'Gammal Tech',
              style: TextStyle(
                fontFamily: 'Montserrat-Regular',
                color: Colors.teal,
              ),
            ),
            actions: [
              InkWell(
                  onTap: () {
                    print('Click Profile Pic');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'images/profilePic.png',
                    ),
                  ))
            ],
            backgroundColor: Colors.white,
          ),
          body: _questionIndex < questions.length
              ? Column(
                  children: [
                    Quiz(
                        questions: questions,
                        answerQuestion: _answerQuestion,
                        questionIndex: _questionIndex)
                  ],
                )
              : Result(_totalScore, _resetQuiz),
        ),
        theme: ThemeData(
          backgroundColor: Colors.teal,
          fontFamily: 'Hind',
        ));
  }
}
