import 'package:flutter/material.dart';
import 'package:vimeoplayer/vimeoplayer.dart';
import 'appbar.dart';
import 'button.dart';
import 'header.dart';

class VideoScreen extends StatelessWidget {
  @required
  final textHeader;
  @required
  final text;
  @required
  final navigateTo;
  @required
  final color;
  @required
  final textColor;
  VideoScreen(
      {this.text,
      this.navigateTo,
      this.color,
      this.textColor,
      this.textHeader});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.teal, //FF15162B // 0xFFF2F2F2
        appBar: MediaQuery.of(context).orientation == Orientation.portrait
            ? AppBar2()
            : PreferredSize(
                child: Container(
                  color: Colors.transparent,
                ),
                preferredSize: Size(0.0, 0.0),
              ),
        body: ListView(children: <Widget>[
          Header(textHeader),
          VimeoPlayer(id: '395212534'),
          Button(
            color: Colors.white,
            textColor: Colors.black,
            navigateTo: navigateTo,
            text: text,
          ),
        ]));
  }
}
