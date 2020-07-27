import 'package:flutter/material.dart';
import 'appbar.dart';
import 'videoCourseEposide.dart';

class VideoCourseEposides extends StatefulWidget {
  @override
  _VideoCourseEposidesState createState() => _VideoCourseEposidesState();
}

class _VideoCourseEposidesState extends State<VideoCourseEposides> {
  final List eposides = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      backgroundColor: Colors.teal,
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: eposides.length,
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
                    'eposide ${eposides[index]}',
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
                          textHeader: 'eposide ${eposides[index]}',
                        ),
                      ),
                    );
                  }),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
