import 'package:flutter/material.dart';
import '../severity_checkup/landing_screen.dart';
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        elevation: 0, //drop shadow
        title: const Text("Severity of Your ilness"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Center(
              child: Text(
              "Results",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 3)
              )
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  width: 200,
                  color: Color.fromARGB(204, 135, 212, 245),
                  child: Column(
                    children: [
                      Text(
                        "You're diagnoised with",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                          height: 3.2
                          ),
                      ),
                      Text(
                        "Initial Level Schizophrenia",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1.2
                          ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommend: Initial Treatment",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Because your severity level is Initial you can use any treatment method",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(164, 0, 0, 0),
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120), //use this for single box
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 150,
                      color: Colors.blue[100],
                      child: Text(
                        "Initial Treatments",
                        style: TextStyle(
                        fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 150,
                      color: Colors.blue[100],
                      child: Text(
                        "Mediocre Treatments",
                        style: TextStyle(
                        fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
