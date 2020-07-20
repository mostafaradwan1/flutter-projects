import 'package:flutter/material.dart';
import 'appbar.dart';
import 'answers.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String dropdownValue = 'Arabic';
  bool withSound = true;
  void _withSoundChanged(bool newValue) => setState(() {
        withSound = newValue;

        if (withSound) {
          Answer(
            withSound: withSound,
          );
        } else {
          Answer(withSound: withSound);
        }
      });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HelperMethod.getAppar(context, false),
        backgroundColor: Colors.teal,
        body: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.surround_sound),
                Text(
                  'With Sound',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                new Checkbox(value: withSound, onChanged: _withSoundChanged)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.language),
                MyStatefulWidget(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.category),
                Text(
                  'Level',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                new Checkbox(
                  value: false,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Logout"),
                IconButton(
                    icon: Image.asset('images/signout.png'), onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Item language = Item(
  'Language',
  Icon(Icons.language),
);

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget();

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Arabic';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Arabic',
        'English',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
