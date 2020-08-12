import 'package:flutter/material.dart';

import 'MasterCLassHome.dart';
import 'videoPlayer.dart';

class MasterClass extends StatelessWidget {
  static var routeName = '/masterclass';

  @override
  Widget build(BuildContext context) {
    return VideoScreen(
      text: Text("More Master Class"),
      navigateTo: MasterClassHome(),
      textHeader: "MasterClass",
      color: Colors.white,
      textColor: Colors.accents,
    );
  }
}
