import 'package:flutter/material.dart';
import 'package:quiz_app/homePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './providers/questionsProvider.dart';

const dev = true;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ctx) => QuizProvider(),
      ),
    ],
    child: new MaterialApp(supportedLocales: [
      Locale('en'),
      Locale('it'),
      Locale('fr'),
      Locale('es'),
      Locale('de'),
      Locale('pt'),
    ], localizationsDelegates: [
      // CountryLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ], home: MyApp()),
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
