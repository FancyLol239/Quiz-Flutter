// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.nextQuestion}) : super(key:key);
  final VoidCallback nextQuestion;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        width: 331.0,
        height: 56.0,
        decoration: BoxDecoration(
          color: Color(0xFFB923CA),
          borderRadius: BorderRadius.circular(23)
        ),
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Text(
          'Next',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}