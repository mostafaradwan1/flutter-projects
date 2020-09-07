import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './videoCourseEposides.dart';
import 'appbar.dart';
import 'header.dart';

var db = FirebaseFirestore.instance;

class VideoCourses extends StatefulWidget {
  static var routeName = '/courses';
  @override
  _VideoCoursesState createState() => _VideoCoursesState();
}

class _VideoCoursesState extends State<VideoCourses> {
  var ids = [];
  var courses = db.collection("courses").get();
  getDOcumentIds() {
    courses.then((snap) {
      snap.docs.forEach((doc) {
        setState(() {
          ids.add(doc.id);
        });
      });
    });
  }

  @override
  void initState() {
    getDOcumentIds();
    super.initState();
  }

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
                  children: ids.map((id) {
                return Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/end_Gammal.jpg',
                        fit: BoxFit.cover,
                      ),
                      RaisedButton(
                          child: Text(id),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoCourseEposides(
                                        e: id,
                                      )),
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
