import 'package:http/http.dart' as http;
import 'dart:convert';

class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);

  factory Question.fromJson(Map<String, dynamic> json) {
    List<Answer> answers = (json['answerList'] as List)
        .map((answer) => Answer.fromJson(answer))
        .toList();

    return Question(
      json['questionText'] as String,
      answers,
    );
  }
}

class Answer {
  final String answerText;
  final bool isIdentifyFilter; //answer checkup

  Answer(this.answerText, this.isIdentifyFilter);

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      json['answerText'] as String,
      json['isIdentifyFilter'] as bool,
    );
  }
}

Future<List<Question>> getQuestionsFromAPI() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:5000/questions')); // Remove the headers

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => Question.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load questions');
  }
}






// class Question {
//   final String questionText;
//   final List<Answer> answerList;

//   Question(this.questionText, this.answerList);
// }

// class Answer {
//   final String answerText;
//   final bool isIdentifyFilter; //answer checkup

//   Answer(this.answerText, this.isIdentifyFilter);
// }

// List<Question> getQuestions() {
//   List<Question> list = [];

//   list.add(Question(
//     "Question 1. ",
//     [
//       Answer("acrophobia", true),
//       Answer("social anxiety", true),
//       Answer("Schizophrenia", true),
//     ],
//   ));

//   list.add(Question(
//     "Question 2. ",
//     [
//       Answer("Schizophrenia", true),
//       Answer("acrophobia", true),
//       Answer("social anxiety", true),
//     ],
//   ));

//   list.add(Question(
//     "Question 3. ",
//     [
//       Answer("social anxiety", true),
//       Answer("Schizophrenia", true),
//       Answer("acrophobia", true),
//     ],
//   ));

//   return list;
// }
