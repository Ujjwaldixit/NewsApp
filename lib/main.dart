import 'package:flutter/material.dart';
import 'package:news_app/apperance/home.dart';

void main() =>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'News App',
      debugShowCheckedModeBanner: false, // to get rid off corner red strip
      theme:ThemeData(
        primaryColor: Colors.white,

      ),
        home:Home(),
    );
  }
}



