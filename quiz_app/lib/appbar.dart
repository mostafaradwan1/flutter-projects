import 'package:flutter/material.dart';

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        // automaticallyImplyLeading: false,
        iconTheme: new IconThemeData(color: Colors.teal),
        title: Row(
          children: <Widget>[
            IconButton(
              icon: Image.asset('images/logo.png'),
              onPressed: () {},
            ),
            Text(
              'Gammal Tech',
              style: TextStyle(color: Colors.teal),
            ),
          ],
        ),
        backgroundColor: Colors.white);
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
