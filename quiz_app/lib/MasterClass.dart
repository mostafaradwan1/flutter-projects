import 'package:flutter/material.dart';
import 'appbar.dart';
import 'header.dart';
import 'videoPlayerExample.dart';

class MasterClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      body: Column(
        children: <Widget>[
          Header(
            'MasterClass',
          ),
          VideoPlayerScreen(),
        ],
      ),
      backgroundColor: Colors.teal,
    );
  }
}
