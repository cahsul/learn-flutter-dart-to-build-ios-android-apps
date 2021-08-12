import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.text, {Key? key}) : super(key: key);

  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlue, width: double.infinity,
        margin: EdgeInsets.all(10),

        child: Text(
          text, textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28),
        )
    );
  }
}
