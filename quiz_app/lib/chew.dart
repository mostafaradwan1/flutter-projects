import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'appbar.dart';
import 'videoCourseEposides.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 =
        VideoPlayerController.network('https://youtu.be/pQ1rtumw9JE');
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
    );

    _videoPlayerController1.addListener(() {
      if (_videoPlayerController1.value.position ==
          _videoPlayerController1.value.duration) {
        print('video Ended');
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: defualtAppBar,
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 400,
                height: 400,
                child: Chewie(
                  controller: _chewieController,
                ),
                margin: EdgeInsets.all(10),
              ),
              RaisedButton(
                  child: Text(
                    'Back To Course',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoCourseEposides()),
                      );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
//_questionIndex < questions.length
//     ? Column(
//         children: [
//           Quiz(
//               questions: questions,
//               answerQuestion: _answerQuestion,
//               questionIndex: _questionIndex)
//         ],
//       )
//     : Result(_totalScore, _resetQuiz),
