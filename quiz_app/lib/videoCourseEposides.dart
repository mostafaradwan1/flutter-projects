import 'package:flutter/material.dart';
import 'appbar.dart';
import './chew.dart';

class VideoCourseEposides extends StatelessWidget {
  final List eposides = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:HelperMethod.getAppar(context,false),
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
                        MaterialPageRoute(builder: (context) => ChewieDemo()),
                      );
                    }),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}


