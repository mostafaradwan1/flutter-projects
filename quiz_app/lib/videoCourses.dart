import 'package:flutter/material.dart';
import './videoCourseEposides.dart';
import 'appbar.dart';
import 'header.dart';

class VideoCourses extends StatelessWidget {
  static var routeName = '/courses';

  final List courseTitles = ['C Course', 'C++ Course', 'Python Course'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar2(),
      body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
          children: <Widget>[
            Header("Our Courses"),
            Column(
                  children: courseTitles.map((e) {
                return Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/end_Gammal.jpg',
                        fit: BoxFit.cover,
                      ),
                      RaisedButton(
                          child: Text(e),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoCourseEposides()),
                            );
                          })
                    ],
                  ),
                );
            }).toList()),
          ],
        ),
              ),
      ),
    );
  }
}
