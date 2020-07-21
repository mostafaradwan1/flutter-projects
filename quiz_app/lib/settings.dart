import 'package:flutter/material.dart';
import 'appbar.dart';
import 'answers.dart';
import 'header.dart';
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
          Answer(withSound: !withSound);
        }
      });
  void _withLevelChanged() => setState(() {
        withSound = !withSound;
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      backgroundColor: Colors.teal,
      body: Column(
        children: <Widget>[
          Header("Settings"),
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
              DropDownMenu(),
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
                onChanged: (withSound) => _withLevelChanged,
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
    );
  }
}

class DropDownMenu extends StatefulWidget {
  DropDownMenu();

  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
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
