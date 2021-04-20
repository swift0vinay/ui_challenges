import 'package:flutter/material.dart';
import 'package:ui_challanges/bulbChallenge.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenges',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Monster",
      ),
      home: BulbChallenge(),
    );
  }
}
