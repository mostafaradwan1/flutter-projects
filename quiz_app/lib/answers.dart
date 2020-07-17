import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final testFunc;
  Answer(this.answer, this.testFunc);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              child: Text(answer),
              onPressed: testFunc,
            ),
          )
        ],
      ),
    );
  }
}
