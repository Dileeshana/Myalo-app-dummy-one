import 'package:flutter/material.dart';

class ReleventDistrotion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // color: Colors.blue,
            height: 40,
            width: 300,
            margin: EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54,),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
              "Negative Self-labeling",
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: Text(
              "Am I using extreme labels or judgments without\nconsidering the full context?",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Container(
            height: 400,
            width: 300,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              color: Color.fromARGB(88, 223, 223, 223),
              ),
            alignment: Alignment.bottomRight,
            child: Text(
              "1/1000",
              style: TextStyle(
                color: const Color.fromARGB(158, 0, 0, 0),
                fontSize: 12
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: ElevatedButton(
                    child: Text("Reset", style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      shape: LinearBorder(),
                      backgroundColor: Color.fromARGB(99, 168, 168, 168),
                      elevation: 0
                    ),
                    onPressed: () {}
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text("Done", style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      shape: LinearBorder(),
                      backgroundColor: Colors.blue[600],
                      elevation: 0
                    ),
                    onPressed: () {}
                  ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
