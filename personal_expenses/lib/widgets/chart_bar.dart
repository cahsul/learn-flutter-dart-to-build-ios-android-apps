import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amount;
  final double percentage;

  const ChartBar(this.day, this.amount, this.percentage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      LayoutBuilder(builder: (context, constrain) {
        return
          Column(children: [
            Container(
                height: constrain.maxHeight * 0.04,
                child: FittedBox(child: Text('\$${amount.toStringAsFixed(0)}'))),
            SizedBox(height: constrain.maxHeight * 0.02,),
            Container(
              width: 10,
              height: constrain.maxHeight * 0.8,
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
            SizedBox(height: constrain.maxHeight * 0.02,),
            Container(
                height: constrain.maxHeight * 0.04,
                child: FittedBox(child: Text(day))),

          ],);
      });


  }
}
