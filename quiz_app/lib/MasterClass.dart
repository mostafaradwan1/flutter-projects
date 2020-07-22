import 'package:flutter/material.dart';
import 'appbar.dart';
import 'header.dart';
import 'videoPlayerExample.dart';
import 'MasterCLassHome.dart';

class MasterClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          child: Column(
            children: <Widget>[
              Header(
                'What is MasterClass?',
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                            MasterClassHome(), "Back To MasterClass")),
                  );
                },
                child: Text(
                  'Master Home Page',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.teal,
    );
  }
}
