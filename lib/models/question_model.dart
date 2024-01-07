
//Question model (simple class)
class Question{
  
  final String no;

  final String title;

  final Map<String, bool> answer;

//Constructor
  Question({
    required this.no,
    required this.title,
    required this.answer,
  });

//overide the toStrig method to print the questions on console
  @override
  String toString() {
    return 'Question(id: $no, tittle: $title, options: $answer)';
  }

}