import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amount;
  final double percentage;

  const ChartBar(this.day, this.amount, this.percentage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('\$${amount.toStringAsFixed(0)}'),
      SizedBox(height: 4,),
      Container(
        width: 10, height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(220, 220, 220, 1),
          border: Border.all(color: Colors.grey, width: 1,),
          borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: percentage,
          child: Container(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      Text(day),
      SizedBox(height: 4,),

    ],);
  }
}
