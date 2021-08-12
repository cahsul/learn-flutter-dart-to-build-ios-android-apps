import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final void Function(int) answerQuestion;
  final int questionIndex;
  const Quiz({Key? key, required this.question, required this.answerQuestion, required this.questionIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Question(question[questionIndex]['questionText'] as String),

        ...(question[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((item) => Answer( () => answerQuestion(item['score'] as int), item['text'] as String)).toList(),
      ],
    );
  }
}
