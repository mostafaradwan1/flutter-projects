import 'package:flutter/material.dart';
import 'header.dart';
import 'appbar.dart';
import 'faqButtons.dart';

class FAQ extends StatelessWidget {
  final _FAQuestions = [
    'ما هي البرمجه؟',
    'من أين أبدأ تعلم البرمجه',
    'كيف تم نطوير منهج البرمجه علي موقعنا',
    'خارطه الطريق لتعليم البرمجه و مجالات العمل',
    'ما هو الافضل برمجه الويب ام الموبايل '
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      body: Column(
        children: <Widget>[
          Header('FAQ'),
          Column(
            children: _FAQuestions.map(
              (e) {
                return FAQButton(
                  Text(
                    e,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
      backgroundColor: Colors.teal,
    );
  }
}
