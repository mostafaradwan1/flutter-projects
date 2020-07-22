import 'package:flutter/material.dart';
import 'videoPlayerExample.dart';
import 'FAQ.dart';

class FAQButton extends StatelessWidget {
  final text;
  FAQButton(this.text);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: text,
        textColor: Colors.black,
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(FAQ(), "Back To FAQ")),
          );
        });
  }
}
