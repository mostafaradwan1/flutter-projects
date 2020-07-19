import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Answer extends StatefulWidget {
  final String answer;
  final testFunc;
  Answer(this.answer, this.testFunc);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  soundEffect() async {}

  AudioCache player;

  @override
  void initState() {
    player = AudioCache(prefix: 'sounds/');
    player.load('correct.mp3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              child: Text(widget.answer),
              onPressed: () async {
                await player.play('correct.mp3');
                widget.testFunc();
              },
            ),
          )
        ],
      ),
    );
  }
}
