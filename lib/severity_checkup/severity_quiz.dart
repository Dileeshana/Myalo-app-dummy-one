import 'package:flutter/material.dart';
import 'package:myalo_app/severity_checkup/severity_quiz_model.dart';
import 'model_map.dart';
import 'severity_result.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SeverityQuiz extends StatefulWidget {
  final String illness;

  SeverityQuiz({required this.illness});

  @override
  State<SeverityQuiz> createState() => _SeverityQuizState();
}

class _SeverityQuizState extends State<SeverityQuiz> {
  List<SeverityQuestion> questionList = [];
  int currentQuestionIndex = 0;
  int? selectedOptionId;
  Map<int, int> selectedAnswers = {}; // Store the selected option for each question

  bool failedToLoad = false; // to track if the data fetching has failed
  bool loadingTimedOut = false; // to track if loading timed out

  @override
  void initState() {
    super.initState();

    // Start a timer. If the timer runs out, set loadingTimedOut to true
    // and navigate to the YouTube player
    Future.delayed(Duration(seconds: 5), () {
      if (questionList.isEmpty) {
        setState(() {
          loadingTimedOut = true;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => YouTubeVideoScreen()));
      }
    });

    _fetchQuestions(widget.illness).then((fetchedQuestions) {
      print("Fetched questions: ${fetchedQuestions.length}");
      if (!loadingTimedOut) {
        setState(() {
          questionList = fetchedQuestions;
        });
      }
    });
  }

  Future<List<SeverityQuestion>> _fetchQuestions(String illness) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return getQuestionsForIllness(illness);
  }

  List<SeverityQuestion> getQuestionsForIllness(String illness) {
    return severityQuestionsByIllness[illness] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (questionList.isEmpty) {
      // If the questions haven't been loaded yet, display a loading indicator
      return Scaffold(
        appBar: AppBar(
          title: Text("Loading..."),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
        title: const Text("Severity Checking"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _questionWidget(),
            _optionList(),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 142, 196, 223),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            questionList[currentQuestionIndex].question,
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

  _optionList() {
    return Column(
      children: questionList[currentQuestionIndex].options.entries.map(
        (entry) => _optionButton(entry.key, entry.value),
      ).toList(),
    );
  }

  Widget _optionButton(int id, String text) {
    bool isSelected = id == selectedOptionId;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 40,
      child: ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected
              ? Colors.green.shade400
              : Colors.lightBlueAccent.shade700,
          onPrimary: isSelected ? Colors.black : Colors.black,
        ),
        onPressed: () {
          setState(() {
            selectedOptionId = id;
          });
        },
      ),
    );
  }

  _nextButton() {
    bool islastQuestion = currentQuestionIndex == questionList.length - 1;

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 40,
      child: ElevatedButton(
          child: Text(islastQuestion ? "Show Results" : "Next"),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.green.shade400,
            onPrimary: Colors.black,
          ),
          onPressed: () {
            if (selectedOptionId != null) {
              selectedAnswers[currentQuestionIndex] = selectedOptionId!;
              
              if (islastQuestion) {
                // TODO: Pass the selected answers to the ResultScreen for evaluation.
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
              } else {
                setState(() {
                  selectedOptionId = null;
                  currentQuestionIndex++;
                });
              }
            }
          }),
    );
  }
}

class YouTubeVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'QC_pOHytzrg', 
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video'),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        progressColors: ProgressBarColors(
          playedColor: Colors.blueAccent,
          handleColor: Colors.blueAccent,
        ),
      ),
    );
  }
}



//try this for latest5
// import 'package:flutter/material.dart';
// import 'package:myalo_app/models/severity_quiz_model.dart';
// import 'package:myalo_app/function.dart'; // Import the function.dart file

// import 'severity_result.dart';

// class SeverityQuiz extends StatefulWidget {
//   @override
//   State<SeverityQuiz> createState() => _SeverityQuizState();
// }

// class _SeverityQuizState extends State<SeverityQuiz> {
//   List<Question> questionList = [];
//   int currentQuestionIndex = 0;
//   Answer? selectedAnswer;

//   @override
//   void initState() {
//     super.initState();
//     _fetchQuestions(); // Fetch questions when the component loads
//   }

//   Future<void> _fetchQuestions() async {
//     try {
//       final questionsResponse = await Functions.fetchSeverityQuestions();
//       if (questionsResponse.containsKey('questions')) {
//         final questions = questionsResponse['questions'];
//         setState(() {
//           questionList = List<Question>.from(questions.map((question) => Question.fromJson(question)));
//         });
//       }
//     } catch (e) {
//       // Handle error
//       print('Error fetching questions: $e');
//     }
//   }

//   // ... (Rest of your code remains the same)

//   _nextButton() {
//     bool isLastQuestion = false;
//     if (currentQuestionIndex == questionList.length - 1) {
//       isLastQuestion = true;
//     }

//     return Container(
//       width: MediaQuery.of(context).size.width * 0.5,
//       height: 40,
//       child: ElevatedButton(
//         child: Text(isLastQuestion ? "Show Results" : "Next"),
//         style: ElevatedButton.styleFrom(
//           shape: const StadiumBorder(),
//           primary: Colors.green.shade400,
//           onPrimary: Colors.black,
//         ),
//         onPressed: () {
//           if (isLastQuestion) {
//             // Submit answers and show results
//             _submitAnswersAndShowResults();
//           } else {
//             // Next question
//             setState(() {
//               selectedAnswer = null;
//               currentQuestionIndex++;
//             });
//           }
//         },
//       ),
//     );
//   }

//   Future<void> _submitAnswersAndShowResults() async {
//     final answers = {
//       'answers': questionList.map((question) => {'question': question.questionText, 'answer': selectedAnswer?.answerText}).toList(),
//     };

//     try {
//       final result = await Functions.submitSeverityAnswers(answers);
//       // Process the result and navigate to the result screen
//       // Example: You can extract severity level and recommendations from the result
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultScreen(
//             severityLevel: result['severity'],
//             recommendations: List<String>.from(result['recommendations']),
//           ),
//         ),
//       );
//     } catch (e) {
//       // Handle error
//       print('Error submitting answers and showing results: $e');
//     }
//   }
// }
