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
    "Question A. ",
    [
      Answer("answer 1", true),
      Answer("answer 2", true),
      Answer("answer 3", true),
    ],
  ));

  list.add(Question(
    "Question B. ",
    [
      Answer("answer 5", true),
      Answer("answer 6", true),
      Answer("answer 7", true),
    ],
  ));

  return list;
}
