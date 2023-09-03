import 'package:flutter/material.dart';
import 'package:myalo_app/identified_result/identified_result.dart';
import 'package:myalo_app/identifiyng_quiz/function.dart';
import 'package:myalo_app/identifiyng_quiz/question_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IdentifyQuiz extends StatefulWidget {
  @override
  State<IdentifyQuiz> createState() => _IdentifyQuizState();
}

class _IdentifyQuizState extends State<IdentifyQuiz> {
  List<Question> questionList = [];
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;
  String url = '';

  Map<String, dynamic> answers = {
    'social_anxiety': {},
    'schizophrenia': {},
    'acrophobia': {},
  };

  void selectAnswer(String illness, String question, String answer) {
    setState(() {
      answers[illness][question] = answer;
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch questions from the API when the widget is initialized
    getQuestionsFromAPI().then((questions) {
      setState(() {
        questionList = questions;
      });
    }).catchError((error) {
      print("Error fetching questions: $error");
    });
  }

  void submitAnswers() async {
    try {
      Map<String, dynamic> result = await Functions.submitAnswers(answers);
      // Handle the result and display the most likely illness and scores
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        elevation: 0, //drop shadow
        title: const Text("Identify Your Sickness"),
      ),
      body: questionList.isEmpty // Check if questionList is empty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching
          : _buildQuizWidget(), // Build the quiz widget when questions are available
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     backgroundColor: Colors.blue.shade600,
    //     elevation: 0, //drop shadow
    //     title: const Text("Identify Your Sickness"),
    //   ),
    //   // backgroundColor: Color.fromARGB(251, 197, 245, 255),
    //   body: Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         // const Text(
    //         //   "Identify Your Sickness",
    //         //   style: TextStyle(
    //         //     color: Colors.black87,
    //         //     fontSize: 22,
    //         //   ),
    //         // ),
    //         _questionWidget(),
    //         _answerList(),
    //         _nextButton(),
    //       ],
    //     ),
    //   ),
    // );
  }

   Widget _buildQuizWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ],
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(                //this for show question number
        //   "Question ${currentQuestionIndex+1}/{questionList.length.toString()}",
        //   style: const TextStyle(
        //     color: Colors.black,
        //   ),
        // ),
        const SizedBox(height: 15),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 30, 168, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
  


  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 40,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected
              ? Color.fromARGB(255, 9, 180, 17)
              : Color.fromARGB(255, 160, 220, 255),
          onPrimary: isSelected
              ? const Color.fromARGB(255, 255, 255, 255)
              : Colors.black,
        ),
        onPressed: () {
          setState(() {
            selectedAnswer = answer;
          });
        },
      ),
    );
  }

  // _nextButton() {
  //   bool islastQuestion = false;
  //   if (currentQuestionIndex == questionList.length - 1) {
  //     islastQuestion = true;
  //   }

  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.5,
  //     height: 40,
  //     child: ElevatedButton(
  //         child: Text(islastQuestion ? "Show Results" : "Next"),
  //         style: ElevatedButton.styleFrom(
  //           shape: const StadiumBorder(),
  //           primary: Colors.green.shade400,
  //           onPrimary: Colors.black,
  //         ),
  //         onPressed: () {
  //           if (islastQuestion) {
  //             //redirect to result sheet
  //             Navigator.push(context,
  //                 MaterialPageRoute(builder: (context) => ResultScreen()));
  //           } else {
  //             //next question
  //             setState(() {
  //               selectedAnswer = null;
  //               currentQuestionIndex++;
  //             });
  //           }
  //         }),
  //   );
  // }
  _nextButton() {
  bool isLastQuestion = false;
  if (currentQuestionIndex == questionList.length - 1) {
    isLastQuestion = true;
  }

  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    height: 40,
    child: ElevatedButton(
      child: Text(isLastQuestion ? "Show Results" : "Next"),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.green.shade400,
        onPrimary: Colors.black,
      ),
      onPressed: () async {
        if (isLastQuestion) {
          try {
            Map<String, dynamic> result = await Functions.submitAnswers(answers);
            // Handle the result and display the most likely illness and scores
            // You can navigate to the result screen with this data
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(result)));
          } catch (e) {
            // Handle error
            print("Error: $e");
          }
        } else {
          // Next question
          setState(() {
            selectedAnswer = null;
            currentQuestionIndex++;
          });
        }
      },
    ),
  );
}


}
