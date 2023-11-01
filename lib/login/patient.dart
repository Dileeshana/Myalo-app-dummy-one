import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../identifiyng_quiz/identify_quiz.dart';
import 'login.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _nextButton(),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  _nextButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 40,
      child: ElevatedButton(
          child: Text("Lets get started"),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.green.shade400,
            onPrimary: Colors.black,
          ),
          onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => IdentifyQuiz()));
          }),
    );
  }
}