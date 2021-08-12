import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final void Function() reset;
  const Result(this.finalScore, this.reset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text(this.finalScore.toString()),
        TextButton(onPressed: this.reset, child: Text('BACK..'))
      ],
    ),);
  }
}
