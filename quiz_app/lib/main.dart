import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import 'Question.dart';
// import './dropDown.dart';
// import './videoPlayer.dart';

// import 'chew.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override //(to make clear you are not accedently override ) not required decorator provided by flutter to make code cleaner
  Widget build(BuildContext context) {
    var questions = [
      'كم عدد الدروس القادمة الخاصة بطريقة التفكير السليمة لأي رائد الأعمال',
      'تغيير طريقة التفكير هو أمر شاق، لذا يجب عليك',
      'تغيير طريقة التفكير أمر شاق وإستيعاب المعلومات التي في الدروس لا يعني إطلاقا أن طريقة تفكيرك بدأت في التغيير',
      'لكي تفهم المحتوي يجب أن يكون هدفك الأساسي هو إنشاء شركة كبيرة دخلها السنوي مليار دولار أو أكثر',
      'يجب أن يكون هدفك متعلق بالعمل حتي تستطيع النجاح في مجال ريادة الأعمال',
    ];
    var answers = [
      [10, 11, 12, 14],
      [
        'ان تشاهد ما تشاء من الدروس يوميا طالما تفهم',
        'ان تشاهد درس واحد فقط يوميا'
      ],
      ['صح', 'خطا'],
      ['صحيح'],
      ['خطا ', 'صحيح'],
    ];

    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.teal,
          appBar: AppBar(
            leading: IconButton(
              padding: EdgeInsets.all(5.0),
              icon: Image.asset('assets/images/logo.png'),
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
                      'assets/images/profilePic.png',
                    ),
                  ))
            ],
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              QUestion(questions[_questionIndex]),
              Answer(
                answers[_questionIndex],
                _answerQuestion
              ),
              
            ],
          ),
        ),
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.teal,
          accentColor: Colors.teal,
          backgroundColor: Colors.teal,
          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ));
  }
}
