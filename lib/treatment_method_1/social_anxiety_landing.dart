import 'package:flutter/material.dart';

class SocialAnxietyLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  color: Colors.black,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Worried about"),
                        TextSpan(text: "your"),
                        TextSpan(text: "Social Anxiety?")
                      ]
                    )
                    )
                )
              ],
            ),
          ),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}