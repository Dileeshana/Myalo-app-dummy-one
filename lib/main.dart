import 'package:flutter/material.dart';
import 'package:myalo_app/identifiyng_quiz/identify_quiz.dart';
import 'package:myalo_app/screens/bottom_bar.dart';

// import 'identified_result/identified_result.dart';
import 'severity_checkup/landing_screen.dart';
import 'severity_checkup/severity_quiz.dart';
import 'severity_checkup/severity_result.dart';
import 'treatment_method_1/schizophrenia/schizophrenia_landing.dart';
import 'treatment_method_1/schizophrenia/schizophrenia_ui_2.dart';
import 'treatment_method_1/social anxiety/relevent_cog_distrotion.dart';
import 'treatment_method_1/social anxiety/social_anxiety_distrotion.dart';
import 'treatment_method_1/social anxiety/social_anxiety_landing.dart';
import 'treatment_method_1/social anxiety/social_anxiety_marks.dart';
import 'treatment_method_2/landing.dart';

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
      home: HighSeverityLanding(),
    );
  }
}