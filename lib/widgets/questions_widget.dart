// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key, 
    required this.question, 
    required this.indexAction, 
    required this.totalQuestions})
    : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalQuestions: $question',
        style: TextStyle(
          fontSize: 20,
          color: netral,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        )
      ),
    );
  }
}