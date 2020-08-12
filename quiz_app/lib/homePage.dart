import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'spring_buttons.dart';
import 'Quiz.dart';
import 'videoCourses.dart';
import 'appbar.dart';

class HomePage extends StatelessWidget {
  static var routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
       drawer: AppDrawer(),
      appBar: AppBar2(),
      body: Container(
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
          )),
    );
  }
}
