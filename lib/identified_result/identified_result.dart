// import 'dart:js';

import 'package:flutter/material.dart';
import '../severity_checkup/landing_screen.dart';

class ResultScreen extends StatelessWidget {
  // final Map<String, dynamic> result;

  // ResultScreen(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        elevation: 0, //drop shadow
        title: const Text("Identify Your Sickness"),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Most Likely Illness: ${result['most_likely_illness']}"),
      //       // Display other information from the result as needed
      //     ],
      //   ),
      // ),
      body: Container(
          child: Column(
        children: [
          Spacer(flex: 1),
          Text(
            "Result",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.black),
          ),
          Spacer(),
          // _resultSchizophrenia(),
          _resultAcrophobia(),
          // _resultSocialAnxeity(),
          Spacer(flex: 2),
          _nextSeverityChecupButton(context),
          Spacer(flex: 5),
        ],
      )),
    );
  }

  _resultSchizophrenia() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Schizophrenia",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              Text(
                "75%",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _resultAcrophobia() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "based on the questionnaire\n you have",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              Text(
                "Acrophobia",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _resultSocialAnxeity() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SocialAnxeity",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              Text(
                "0%",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        )
      ],
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
