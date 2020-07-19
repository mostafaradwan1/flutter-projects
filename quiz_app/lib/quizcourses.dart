import 'package:flutter/material.dart';
import 'appbar.dart';
import 'videoCourseEposides.dart';

class CoursesForInterview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List courseTitles = ['C Quiz', 'C++ Quiz', 'Python Qiiz'];

    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.teal,
          appBar: HelperMethod.getAppar(context,false),
          body: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: courseTitles.map((e) {
                return RaisedButton(
                    child: Text(
                      e,
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoCourseEposides()),
                      );
                    });
              }).toList(),
            ),
          ),
        ),
        theme: ThemeData(
          backgroundColor: Colors.teal,
          fontFamily: 'Hind',
        ));
  }
}
