import 'package:flutter/material.dart';
import '../constants.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({Key? key, 
      required this.answer, 
      required this.color,}) 
      : super(key:key);
  final String answer;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          answer,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color : color.red != color.green ? netral : Colors.black
          ),
        ),
      )
    );
  }
}