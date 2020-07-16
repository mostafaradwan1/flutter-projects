import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final List<Map<String, Object>> answers;
  final testFunc;
  Answer(this.answers, this.testFunc);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
          children: answers.map((a) {
        return RaisedButton(
          child: Text(a['text'].toString()),
          onPressed: () => testFunc(a['score']),
        );
      }).toList()),
    );
  }
}
