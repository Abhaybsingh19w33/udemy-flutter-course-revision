import 'package:flutter/material.dart';
import 'package:intro_scaffold/ui/gesture.dart';
// import './ui/home.dart';

void main() {
  String title = "Gesture";
  runApp( MaterialApp(
    // title: "Scaffold",
    // home: Home(),
    title : title,
    home: Guesture(title : title,),
  ));
}
