import 'package:flutter/material.dart';
import 'appbar.dart';
import 'splashScreen.dart';
import 'homePage.dart';

void main() {
  runApp(new MaterialApp(
    home: MySplashScreen(),
  ));
}

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
        {'text': 'yes', 'score': 0},
        {'text': 'yes', 'score': 0},
        {'text': 'yes', 'score': 0},
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
        {'text': 'yes', 'score': 0},
        {'text': 'yes', 'score': 0},
        {'text': 'yes', 'score': 0},
        {'text': 'yes', 'score': 1},
      ],
    },
    {
      'questionText':
          'تغيير طريقة التفكير أمر شاق وإستيعاب المعلومات التي في الدروس لا يعني إطلاقا أن طريقة تفكيرك بدأت في التغيير',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '10', 'score': 0},
        {'text': '10', 'score': 0},
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
        appBar: defualtAppBar,
        backgroundColor: Colors.teal,
        body: HomePage(),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
