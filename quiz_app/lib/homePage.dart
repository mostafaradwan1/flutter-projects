import 'package:flutter/material.dart';
import 'spring_buttons.dart';
import 'Quiz.dart';
import 'videoCourses.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            AnimatedButtons(text: 'Quizes', nextPage: Quiz()),
            AnimatedButtons(text: 'Courses', nextPage: VideoCourses()),
            FloatingActionButton(
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () {},
              backgroundColor: Colors.green,
            ),
          ],
        ));
        
  }
}
