import 'package:flutter/material.dart';

import '../severity_checkup/landing_screen.dart';
import 'mock_data.dart';
import 'quiz_model.dart';

class ResultScreen extends StatefulWidget {
  final Map<int, Answer> userAnswers;
  
  ResultScreen(this.userAnswers);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String? predictedIllness;

  @override
  void initState() {
    super.initState();
    predictedIllness = _predictIllness();
  }

  String _predictIllness() {
    Map<int, double> answerWeights = {
      1: -1.0,  // No
      2: 0.5,   // Maybe
      3: 1.0    // Yes
    };

    // Segmented by illness based on your description
    Map<String, List<int>> questionSegments = {
      'social anxiety': [0, 1, 2], 
      'schizophrenia': [3, 4, 5], 
      'acrophobia': [6, 7, 8]
    };

    String predictedIllness = '';
    double highestScore = double.negativeInfinity;

    questionSegments.forEach((illness, indices) {
      double illnessScore = 0.0;
      for (int index in indices) {
        double scoreToAdd = answerWeights[widget.userAnswers[index]?.answerId] ?? 0;
        illnessScore += scoreToAdd;
      }
      
      if (illnessScore > highestScore) {
        highestScore = illnessScore;
        predictedIllness = illness;
      }
    });

    return predictedIllness;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Based on your answers, you might have:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '$predictedIllness',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _nextSeverityChecupButton(context),
          ],
        ),
      ),
    );
  }


  _nextSeverityChecupButton(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      child: ElevatedButton(
        child: Text("Next"),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: Colors.blue.shade600,
          onPrimary: Color.fromARGB(230, 255, 255, 255),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SeverityLanding()));
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:myalo_app/identifiyng_quiz/quiz_model.dart';
// import '../severity_checkup/landing_screen.dart';

// class ResultScreen extends StatelessWidget {
//   const ResultScreen(Map<int, Answer> userAnswers);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.blue.shade600,
//         elevation: 0, //drop shadow
//         title: const Text("Identify Your Sickness"),
//       ),
//       body: Container(
//           child: Column(
//         children: [
//           const Spacer(flex: 1),
//           Text(
//             "Result",
//             style: Theme.of(context)
//                 .textTheme
//                 .headline5
//                 ?.copyWith(color: Colors.black),
//           ),
//           Spacer(),
//           // _resultSchizophrenia(),
//           _resultAcrophobia(),
//           // _resultSocialAnxeity(),
//           Spacer(flex: 2),
//           _nextSeverityChecupButton(context),
//           Spacer(flex: 5),
//         ],
//       )),
//     );
//   }

//   _resultSchizophrenia() {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(15),
//           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 224, 224, 224),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Schizophrenia",
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 13,
//                 ),
//               ),
//               Text(
//                 "75%",
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 13,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   _resultAcrophobia() {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(15),
//           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 224, 224, 224),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "based on the questionnaire\n you have",
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 13,
//                 ),
//               ),
//               Text(
//                 "Acrophobia",
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 15,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   _resultSocialAnxeity() {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(15),
//           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 224, 224, 224),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "SocialAnxeity",
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 13,
//                 ),
//               ),
//               Text(
//                 "0%",
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 13,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }

  // _nextSeverityChecupButton(BuildContext context) {
  //   return Container(
  //     width: 100,
  //     height: 40,
  //     child: ElevatedButton(
  //       child: Text("Next"),
  //       style: ElevatedButton.styleFrom(
  //         shape: StadiumBorder(),
  //         primary: Colors.blue.shade600,
  //         onPrimary: Color.fromARGB(230, 255, 255, 255),
  //       ),
  //       onPressed: () {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => SeverityLanding()));
  //       },
  //     ),
  //   );
  // }
