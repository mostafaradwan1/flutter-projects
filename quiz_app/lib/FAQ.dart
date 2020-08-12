import 'package:flutter/material.dart';
import 'header.dart';
import 'appbar.dart';
import 'Button.dart';
import 'videoPlayer.dart';

class FAQ extends StatelessWidget {
  final _faquestions = [
    'ما هي البرمجه؟',
    'من أين أبدأ تعلم البرمجه',
    'كيف تم نطوير منهج البرمجه علي موقعنا',
    'خارطه الطريق لتعليم البرمجه و مجالات العمل',
    'ما هو الافضل برمجه الويب ام الموبايل '
  ];
  static var routeName = '/faq';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      body: Column(
        children: <Widget>[
          Header('FAQ'),
          Column(
            children: _faquestions.map(
              (text) {
                return Button(
                  text: Text(text),
                  navigateTo: VideoScreen(
                    navigateTo: FAQ(),
                    color: Colors.black,
                    textColor: Colors.white,
                    text: Text(
                      "Back TO FAQ",
                    ),
                    textHeader: text,
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
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
