import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        elevation: 0, //drop shadow
        title: const Text("Identify Your Sickness"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Text(
                "Result",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.black),
              ),
              _resultSchizophrenia(),
              _resultAcrophobia(),
              _resultSocialAnxeity(),
            ],
        )
      ),
    );
  }

  _resultSchizophrenia() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "Schizophrenia",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }

  _resultAcrophobia() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "Acrophobia",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }

  _resultSocialAnxeity() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "Social Anxeity",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }
}
