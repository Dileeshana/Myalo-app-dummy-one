// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Question {
//   final String questionText;
//   final List<Answer> answerList;

//   Question(this.questionText, this.answerList);

//   factory Question.fromJson(Map<String, dynamic> json) {
//     List<Answer> answers = (json['answerList'] as List)
//         .map((answer) => Answer.fromJson(answer))
//         .toList();

//     return Question(
//       json['questionText'] as String,
//       answers,
//     );
//   }
// }

// class Answer {
//   final String answerText;
//   final bool isIdentifyFilter; //answer checkup

//   Answer(this.answerText, this.isIdentifyFilter);

//   factory Answer.fromJson(Map<String, dynamic> json) {
//     return Answer(
//       json['answerText'] as String,
//       json['isIdentifyFilter'] as bool,
//     );
//   }
// }

// Future<List<Question>> getQuestionsFromAPI() async {
//   final response = await http.get(Uri.parse('http://10.0.2.2:5000/questions')); // Remove the headers

//   if (response.statusCode == 200) {
//     final List<dynamic> jsonData = json.decode(response.body);
//     return jsonData.map((data) => Question.fromJson(data)).toList();
//   } else {
//     throw Exception('Failed to load questions');
//   }
// }

class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isIdentifyFilter; //answer checkup
  Answer(this.answerText, this.isIdentifyFilter);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
    "1. Are you particularly anxious or fearful when looking down from a height, even if you are in a safe and secure environment? ",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  list.add(Question(
    "2.	Do you actively avoid situations or places that involve heights, such as avoiding tall buildings, amusement park rides, or hiking in elevated areas? ",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  list.add(Question(
    "3.	Do you experience intense anxiety or fear when you are in high places, such as tall buildings, bridges, or mountains? ",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  list.add(Question(
    "4.	Do you have difficulty organizing your thoughts or expressing them coherently?",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  list.add(Question(
    "5.	Do you often experience hallucinations, such as seeing, hearing, or feeling things that others cannot perceive?",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  list.add(Question(
    "6.	Do you often withdraw from social interactions, preferring to be alone?",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  list.add(Question(
    "7.	Do you work while being observed?",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  list.add(Question(
    "8.	Have you ever felt that your thoughts are being broadcasted or that others can hear your internal thoughts?",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  list.add(Question(
    "9.	When faced with a height-related situation, do you experience physical symptoms of anxiety, such as rapid heartbeat, trembling, sweating, or shortness of breath?",
    [
      Answer("Yes", true),
      Answer("No", true),
      Answer("Maybe", true),
    ],
  ));

  return list;
}
