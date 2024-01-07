// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_game_quiz/constants.dart';
import 'package:flutter_game_quiz/screens/PerangDunia2.dart';
import 'package:flutter_game_quiz/screens/SejarahIslamIndonesia.dart';
import 'package:flutter_game_quiz/screens/SoalSejarahIndo.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              "Let's Play",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              "Choose A Category Before Start \nPlaying",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF),
              ),
            ),

            SizedBox(height: 93.0),
            _buildClickableBox("Sejarah kemerdekaan Indonesia", Color(0xFFFC616C),() {
              Get.to(() => SKIndo());
            }),
            SizedBox(height: 44.0),
            _buildClickableBox("Sejarah Perang Dunia 2", Color(0xFF51CEBA),() {
              Get.to(() => PerangDunia2());
            }),
            SizedBox(height: 44.0),
            _buildClickableBox("Sejarah Masukknya Islam di Indonesia", Color(0xFFB923CA),() {
              Get.to(() => SejarahIslamID());
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableBox(String text, Color color, VoidCallback onPressed) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 285,
          height: 112,
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
}