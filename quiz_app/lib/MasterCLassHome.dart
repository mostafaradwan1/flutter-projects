import 'package:flutter/material.dart';
import 'package:quiz_app/videoPlayer.dart';
import 'appbar.dart';

class MasterClassHome extends StatelessWidget {
  final master = [
    'The Four Golden Rules',
    'Be A Legend',
    'Flying During the Pandemic',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar2(),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return Card(
            shadowColor: Colors.black,
            elevation: 7,
            margin: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Image.asset('images/end_Gammal.jpg'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoScreen(
                            navigateTo: MasterClassHome(),
                            color: Colors.black,
                            textColor: Colors.white,
                            text: Text(
                              "Back TO MasterClass",
                            ),
                            textHeader: '${master[i]}',
                          ),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "${master[i]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: master.length,
      ),
    );
  }
}
