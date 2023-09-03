import 'dart:convert';
import 'package:http/http.dart' as http;

class Functions {
  static Future<void> setIdentifiedIllness(String illness) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/identified-illness'), // Replace with backend URL
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'illness': illness}),
    );

    if (response.statusCode == 200) {
      print('Identified illness set successfully');
    } else {
      throw Exception('Failed to set identified illness');
    }
  }

  static Future<Map<String, dynamic>> fetchSeverityQuestions() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:5000/severity-questions'), // Replace with backend URL
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch severity questions');
    }
  }

  static Future<Map<String, dynamic>> submitSeverityAnswers(Map<String, dynamic> answers) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/severity-assessment'), // Replace with backend URL
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(answers),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to submit severity answers');
    }
  }
}
