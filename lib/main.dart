import 'package:flutter/material.dart';
import 'package:online_shopping_app/FirstScreen.dart';
import 'package:online_shopping_app/details_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}



