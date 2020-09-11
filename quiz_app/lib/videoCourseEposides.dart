import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/loading.dart';
import 'error.dart';
import 'appbar.dart';
import 'videoCourseEposide.dart';

class VideoCourseEposides extends StatefulWidget {
  final String id;
  VideoCourseEposides({this.id});
  static var routeName = '/course-eposides';
  @override
  _VideoCourseEposidesState createState() => _VideoCourseEposidesState();
}

class _VideoCourseEposidesState extends State<VideoCourseEposides> {
  CollectionReference courses =
      FirebaseFirestore.instance.collection('courses');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: courses.doc(widget.id).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Error();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();

          return Scaffold(
            appBar: AppBar2(),
            backgroundColor: Colors.teal,
            body: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: data['eposides'],
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 50,
                  color: Colors.teal[50],
                  child: Center(
                    child: RaisedButton(
                        hoverColor: Colors.teal[200],
                        child: Text(
                          'Lesson ${index + 1}',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoCourseEposide(
                                navigateTo: VideoCourseEposides(),
                                color: Colors.black,
                                textColor: Colors.white,
                                text: Text(
                                  "Back TO the course",
                                ),
                                textHeader: 'Lesson ${index + 1}',
                                courseId: widget.id,
                              ),
                            ),
                          );
                        }),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          );
        }

        return Loading();
      },
    );
  }
}
