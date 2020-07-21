import 'package:flutter/material.dart';
import './videoCourseEposides.dart';
import 'appbar.dart';

class VideoCourses extends StatelessWidget {
  final List courseTitles = ['C Course', 'C++ Course', 'Python Course'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar2(),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
