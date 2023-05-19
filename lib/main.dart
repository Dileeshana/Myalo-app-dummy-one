import 'package:flutter/material.dart';
import 'package:myalo_app/identifiyng_quiz/identify_quiz.dart';
import 'package:myalo_app/screens/bottom_bar.dart';

import 'identified_result/identified_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
      primarySwatch: Colors.blue
      ),
      home: ResultScreen(),
    );
  }
}