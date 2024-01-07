// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_game_quiz/screens/home_screen.dart';
import 'package:get/get.dart';

void main(){
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}