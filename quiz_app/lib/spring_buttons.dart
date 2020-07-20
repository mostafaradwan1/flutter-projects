import 'package:flutter/material.dart';

// class Button extends StatelessWidget {
//   final text;
//   final nextPage;

//   Button(this.text, this.nextPage);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedButtons();
//     //RaisedButton(
//     //     child: Text(text),
//     //     onPressed: () {
//     //       Navigator.push(
//     //         context,
//     //         MaterialPageRoute(builder: (context) => nextPage),
//     //       );
//     //     });
//   }
// }

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Route"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             // Navigate back to first route when tapped.
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }

class AnimatedButtons extends StatefulWidget {
  final text;
  final nextPage;
  AnimatedButtons({this.text, this.nextPage});
  @override
  _AnimatedButtonsState createState() =>
      _AnimatedButtonsState(text: text, nextPage: nextPage);
}

class _AnimatedButtonsState extends State<AnimatedButtons>
    with SingleTickerProviderStateMixin {
  final text;
  final nextPage;
  _AnimatedButtonsState({this.text, this.nextPage});
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        margin: EdgeInsets.all(10),
        height: 70,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                color: Color(0x80000000),
                blurRadius: 30.0,
                offset: Offset(0.0, 5.0),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomRight,
              colors: [
                Colors.teal[300],
                Colors.teal[200],
              ],
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      );
}
