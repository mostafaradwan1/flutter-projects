import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore < 3) {
      resultText = 'check your answers';
    } else {
      resultText = 'awesome';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            color: Colors.white,
            textColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            child: Text(
              "Back to Home Page",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          RaisedButton(
              color: Colors.black,
              child: Text(
                'Retake The Quiz',
                style: TextStyle(fontSize: 22),
              ),
              textColor: Colors.white,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Quiz()),
                // );
                resetHandler();
              }),
          Text(
            'your score is $resultScore / 3',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
