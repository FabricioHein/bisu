import 'package:bisu/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bisu',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.redAccent,
        accentColor: Colors.red,

        // Define the default font family.
        fontFamily: 'Georgia',

        scaffoldBackgroundColor:  Colors.white,


      ),
      home: LoginPage(),
    );
  }
}