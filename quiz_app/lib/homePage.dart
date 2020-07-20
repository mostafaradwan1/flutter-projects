import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'videoCourses.dart';

class HomePage extends StatelessWidget {
  HomePage();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('Our Courses'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoCourses()),
                );
              }),
          RaisedButton(
              child: Text('Interview Questions'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()),
                );
              }),
          // RaisedButton(
          //     child: Text('settings'),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Settings()),
          //       );
          //     }),
        ],
      ),
    );
  }
}
