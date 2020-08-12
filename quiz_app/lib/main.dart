import 'package:flutter/material.dart';
import 'package:quiz_app/homePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './providers/questionsProvider.dart';
import 'FAQ.dart';
import 'MasterCLassHome.dart';
import 'MasterClass.dart';
import 'MyAccount.dart';
import 'Quiz.dart';
import 'contact.dart';
import 'onlyPhoneSignIn.dart';
import 'settings.dart';
import 'videoCourseEposide.dart';
import 'videoCourseEposides.dart';
import 'videoCourses.dart';

const dev = true;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ctx) => QuizProvider(),
      ),
    ],
    child: new MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('it'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
        Locale('pt'),
      ],
      localizationsDelegates: [
        // CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: MyApp(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        Contact.routeName: (ctx) => Contact(),
        FAQ.routeName: (ctx) => FAQ(),
        PhoneSignInSection.routeName: (ctx) => PhoneSignInSection(),
        MasterClass.routeName: (ctx) => MasterClass(),
        MasterClassHome.routeName: (ctx) => MasterClassHome(),
        MyAccount.routeName: (ctx) => MyAccount(),
        Quiz.routeName: (ctx) => Quiz(),
        Settings.routeName: (ctx) => Settings(),
        VideoCourseEposide.routeName: (ctx) => VideoCourseEposide(),
        VideoCourseEposides.routeName: (ctx) => VideoCourseEposides(),
        VideoCourses.routeName: (ctx) => VideoCourses(),
      },
    ),
  ));
}



class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override //(to make clear you are not accedently override ) not required decorator provided by flutter to make code cleaner
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: AppDrawer(),
      backgroundColor: Colors.teal,
      body: HomePage(),
    );
  }
}
