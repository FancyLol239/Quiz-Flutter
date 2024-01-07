// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_game_quiz/screens/home_screen.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key, 
    required this.result, 
    required this.questionLength,
  }) : super(key: key);

  final int result;
  final int questionLength;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 76.0),
              child: Text(
                'Quiz Finished!',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                  color: netral
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Result',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color : netral
              )
            ),
            SizedBox(height: 5.0),
            CircleAvatar(
              child : 
                Text(
                '$result/$questionLength',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: netral
                ),
              ),
              radius: 40.0,
              backgroundColor: result == questionLength / 5
                ? Colors.yellow
                : result < questionLength / 5
                    ? incorrect
                    :correct,
            ),
            // SizedBox(height: 20.0),
            // Text(result == questionLength / 5
            //     ? 'Almost There'
            //     : result < questionLength / 5
            //         ? 'Try Again'
            //         : 'Great!',
            //     style: TextStyle(
            //       fontFamily: 'Montserrat',
            //       fontWeight: FontWeight.w500,
            //       fontSize: 16.0,
            //       color: netral,
            //     )
            // ),
            SizedBox(height: 90.0),
            Image.asset(
              'images/pngwing1.png',
              width: 252.0,
              height: 220,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 93.0),
            _buildClickableBox("Quit Game", Color(0xFFF7385C),() {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }),
          ],
        )
      )
    );
  }
}
  Widget _buildClickableBox(String text, Color color, VoidCallback onPressed) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 276,
          height: 62,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.0), // Set the radius as needed
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 25),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ),
        ),
      ),
    ],
  );
}