class SeverityQuestion {
  final String question;
  final Map<int, String> options; // We'll use integer IDs for options for simplicity

  SeverityQuestion({required this.question, required this.options});
}

class Answer {
  final int id;
  final String text;

  Answer({required this.id, required this.text});
}