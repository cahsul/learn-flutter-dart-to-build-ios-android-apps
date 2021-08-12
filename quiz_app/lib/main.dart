import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;
  var _finalScore = 0;

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _finalScore = 0;
    });
  }


  void _answarQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex +1;
    });
    _finalScore += score;
  }

  @override
  Widget build(BuildContext context) {

    var question = [
      {
        'questionText' : 'warna kesukaan ?',
        'answer' : [{'text': 'merah', 'score': 10}, {'text': 'biru', 'score': 20}, {'text': 'kuning', 'score': 30},],
      },
      {
        'questionText' : 'hewan kesukaan ?',
        'answer' : [{'text': 'macan', 'score': 10}, {'text': 'kuda', 'score': 20}, {'text': 'sapi', 'score': 30},],
      },

    ];

    return MaterialApp(
      home:

      Scaffold(
        appBar: AppBar(title: Text("My First Apps"),),
        body: (_questionIndex < question.length) ? Quiz(question: question, answerQuestion: _answarQuestion, questionIndex: _questionIndex,) :
              Result(_finalScore, _reset),
      ),
    );
  }
}


