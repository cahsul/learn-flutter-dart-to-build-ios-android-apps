import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback onPressed;
  final String answerTest;

  const Answer(this.onPressed, this.answerTest, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      child: ElevatedButton(onPressed: this.onPressed, child: Text(this.answerTest),),
    );
  }
}
