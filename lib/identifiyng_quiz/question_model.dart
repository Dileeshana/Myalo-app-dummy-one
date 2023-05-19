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
    "Question 1. ",
    [
      Answer("answer A", true),
      Answer("answer B", true),
      Answer("answer C", true),
    ],
  ));

  list.add(Question(
    "Question 2. ",
    [
      Answer("answer D", true),
      Answer("answer E", true),
      Answer("answer F", true),
    ],
  ));

  return list;
}
