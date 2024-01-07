// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_game_quiz/constants.dart';
import '../models/question_model.dart';
import '../widgets/questions_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/answer_card.dart';
import '../widgets/result_box.dart';

class PerangDunia2 extends StatefulWidget {
  const PerangDunia2({super.key});

  @override
  State<PerangDunia2> createState() => _PerangDunia2State();
}

class _PerangDunia2State extends State<PerangDunia2> {
  
  List<Question> _questions = [
    Question(
      no: '1',
      title: 'Kapan Perang Dunia II dimulai?',
      answer: {'1935' : false, '1938': false, '1939': true, '1941': false },
    ),
    Question(
      no: '2',
      title: 'Apa yang menjadi pemicu langsung untuk dimulainya Perang Dunia II?',
      answer: {'Pendudukan Jerman terhadap Austria' : false, 'Invasi Jerman ke Polandia': true, 'Penandatanganan Perjanjian Munich': false, 'Serangan Jepang ke Pearl Harbor': false },
    ),
        Question(
      no: '3',
      title: 'Negara mana yang menjadi poros utama (Axis) dalam Perang Dunia II?',
      answer: {'Uni Soviet, Britania Raya, dan Prancis' : false, 'Jerman, Italia, dan Jepang': true, 'Amerika Serikat, Britania Raya, dan China': false, 'Jerman, Uni Soviet, dan Prancis': false },
    ),
        Question(
      no: '4',
      title: 'Operasi Overlord merupakan kode nama untuk invasi sekutu ke daratan Eropa pada tahun 1944. Di mana operasi ini dilaksanakan?',
      answer: {'Italia' : false, 'Prancis': true, 'Belgia': false, 'Polandia': false },
    ),
        Question(
      no: '5',
      title: 'Apa yang menjadi akhir dari Perang Dunia II di Pasifik setelah dua bom atom dijatuhkan oleh Amerika Serikat?',
      answer: {'Pertempuran Midway' : false, ' Pertempuran Iwo Jima': false, 'Pertempuran Okinawa': false, 'Penyerahan Jepang': true },
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