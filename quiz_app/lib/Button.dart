import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final text;
  final navigateTo;
  final color;
  final textColor;
  Button(
      {@required this.text,
      @required this.navigateTo,
      @required this.color,
      @required this.textColor});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: text,
        textColor: color,
        color: textColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigateTo));
        });
  }
}
