// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_game_quiz/constants.dart';
import '../models/question_model.dart';
import '../widgets/questions_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/answer_card.dart';
import '../widgets/result_box.dart';

class SKIndo extends StatefulWidget {
  const SKIndo({super.key});

  @override
  State<SKIndo> createState() => _SKIndoState();
}

class _SKIndoState extends State<SKIndo> {

  List<Question> _questions = [
    Question(
      no: '1',
      title: 'Kapan dimulai nya perjanjian Renville ?',
      answer: {'17 Agustus 1945' : false, '10 November 1945': false, '19 Desember 1948': false, '8 Januari 1948': true },
    ),
    Question(
      no: '2',
      title: 'Apa yang menjadi penyebab utama perang kemerdekaan Indonesia pada tahun 1945-1949?',
      answer: {'Ekspansi kolonialisme Jepang' : false, 'Pengaruh Revolusi Rusia': false, 'Keterlibatan Indonesia dalam Perang Dunia II': true, 'Perintah VOC': false },
    ),
        Question(
      no: '3',
      title: 'Kapan Proklamasi Kemerdekaan Indonesia secara resmi diumumkan?',
      answer: {'17 Agustus 1945' : true, '1 Mei 1945': false, '10 November 1945': false, '20 Juli 1945': false },
    ),
        Question(
      no: '4',
      title: 'Apa yang menjadi tujuan utama Konferensi Meja Bundar (KMB) pada tahun 1949?',
      answer: {'Pembentukan Negara Kesatuan Republik Indonesia' : true, 'Pembagian wilayah Indonesia kepada negara-negara tetangga': false, 'Pembentukan Federasi Negara-Negara Asia Tenggara': false, 'Pembentukan organisasi militer bersama dengan Belanda': false },
    ),
        Question(
      no: '5',
      title: 'Perjanjian yang mengakhiri Perang Diponegoro pada tahun 1830 adalah...',
      answer: {'Perjanjian Giyanti' : true, 'Perjanjian Linggarjati': false, 'Perjanjian KMB': false, 'Perjanjian Salatiga': false },
    ),
  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion(){
    if (index == _questions.length - 1) {
      showDialog(
        context: context, 
        builder: (ctx) => ResultBox(
              result: score,
              questionLength: _questions.length,
        )
      );
      // return;
    } else {
      if(isPressed){
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("You have not answered this question"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0)
          )
        );
      }
    }
  }

  void checkAnswerAndUpdate(bool value ){
    if(isAlreadySelected) {
      return;
    } else {
      if(value == true){
        score ++;
      }
      setState(() {
          isPressed = true;
          isAlreadySelected = true;
        }); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding :  const EdgeInsets.all(18.0), 
            child: Text(
             'Score: $score',
             style: TextStyle(
                fontSize: 18.0,
                color: netral
              ),
            )
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 38.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              question: _questions[index] .title,
              totalQuestions: _questions.length,
            ),
            //  Divider(color: netral),
            const SizedBox(height: 25.0,),
            for(int i =0; i < _questions[index].answer.length; i++)
              GestureDetector(
                onTap : () => checkAnswerAndUpdate(
                  _questions[index].answer.values.toList()[i]
                ),
                child: AnswerCard(
                  answer: _questions[index].answer.keys.toList()[i],
                  color: isPressed ? _questions[index].answer.values.toList()[i] == true 
                        ? correct
                        : incorrect 
                        : netral,
                  
                ),
              )
          ],
        )
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}