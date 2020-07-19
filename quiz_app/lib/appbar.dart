import 'package:flutter/material.dart';

class HelperMethod {
  static AppBar getAppar(BuildContext context, bool isHomePage) {
    return AppBar(
      leading: IconButton(
        padding: EdgeInsets.all(5.0),
        icon: Image.asset('images/logo.png'),
        onPressed: () {},
      ),
      title: Text(
        'Gammal Tech',
        style: TextStyle(
          fontFamily: 'Montserrat-Regular',
          color: Colors.teal,
        ),
      ),
      actions: [
        !isHomePage
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.teal,
                ))
            : Icon(Icons.home)
      ],
      backgroundColor: Colors.white,
    );
  }
}

// class DefualtAppBar extends AppBar {
//   BuildContext context;
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         padding: EdgeInsets.all(5.0),
//         icon: Image.asset('images/logo.png'),
//         onPressed: null,
//       ),
//       title: Text(
//         'Gammal Tech',
//         style: TextStyle(
//           fontFamily: 'Montserrat-Regular',
//           color: Colors.teal,
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.teal,
//           ),
//           onPressed: () {},
//         ),
//       ],
//       backgroundColor: Colors.white,
//     );
//   }
// }

/*AppBar defualtAppBar = AppBar(
  leading: IconButton(
    padding: EdgeInsets.all(5.0),
    icon: Image.asset('images/logo.png'),
    onPressed: null,
  ),
  title: Text(
    'Gammal Tech',
    style: TextStyle(
      fontFamily: 'Montserrat-Regular',
      color: Colors.teal,
    ),
  ),
  actions: [
    IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.teal,
      ),
      onPressed: () {},
    ),
  ],
  backgroundColor: Colors.white,
);
*/
