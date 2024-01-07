// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_game_quiz/constants.dart';
import '../models/question_model.dart';
import '../widgets/questions_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/answer_card.dart';
import '../widgets/result_box.dart';

class SejarahIslamID extends StatefulWidget {
  const SejarahIslamID({super.key});

  @override
  State<SejarahIslamID> createState() => _SejarahIslamIDState();
}

class _SejarahIslamIDState extends State<SejarahIslamID> {
  
    List<Question> _questions = [
    Question(
      no: '1',
      title: 'Siapakah ulama yang dikenal sebagai "Wali Songo," yang berperan penting dalam penyebaran Islam di Indonesia?',
      answer: {'Sunan Bonang' : false, 'Sunan Kalijaga': false, 'Sunan Giri': false, 'Semua jawaban benar': true },
    ),
    Question(
      no: '2',
      title: 'Kapan Islam pertama kali diperkenalkan di wilayah yang sekarang menjadi Indonesia?',
      answer: {'Abad ke-7' : false, 'Abad ke-9': false, 'Abad ke-11': true, 'Abad ke-13': false },
    ),
        Question(
      no: '3',
      title: 'Apa yang menjadi peran utama Wali Songo dalam penyebaran Islam di Indonesia?',
      answer: {'Berdagang dan berinteraksi dengan masyarakat setempat' : false, ' Mendirikan institusi pendidikan Islam': false, 'Melakukan perjalanan dakwah dan memberikan contoh kehidupan Islami': true, 'Memimpin pasukan untuk menyebarkan agama Islam': false },
    ),
        Question(
      no: '4',
      title: 'Manakah dari kerajaan-kerajaan berikut yang pertama kali mengadopsi agama Islam di Indonesia?',
      answer: {'Srivijaya' : false, 'Kutai Martadipura': true, 'Majapahit': false, 'Demak': false },
    ),
        Question(
      no: '5',
      title: 'Bagaimana peran Syekh Yusuf dalam sejarah Islam Indonesia?',
      answer: {'Memimpin pemberontakan melawan penjajah' : true, 'Mendirikan kerajaan Islam di Jawa Barat': false, 'Berperan dalam perdagangan dan penyebaran Islam di tanah Jawa': false, 'Membangun masjid pertama di Indonesia': false },
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