import 'package:flutter/material.dart';

import 'appbar.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      body: Center(
        child: Text("Something went wrong"),
      ),
    );
  }
}
