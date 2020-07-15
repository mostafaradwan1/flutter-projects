import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final List answer;
  final testFunc;
  Answer(this.answer, this.testFunc);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
          children: answer.map((a) {
        return RaisedButton(
          child: Text(a.toString()),
          onPressed: testFunc,
        );
      }).toList()),
    );
  }
}

