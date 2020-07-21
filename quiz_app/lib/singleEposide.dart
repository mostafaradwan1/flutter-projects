import 'package:flutter/material.dart';
import 'appbar.dart';
import 'chew.dart';

class SingleEposide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      backgroundColor: Colors.teal,
      body: Column(
        children: <Widget>[
          ChewieDemo(),
        ],
      ),
    );
  }
}
