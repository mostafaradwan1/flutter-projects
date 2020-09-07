import 'package:flutter/material.dart';
import 'package:quiz_app/appbar.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
