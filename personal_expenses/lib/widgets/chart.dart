import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactionVm.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<TransactionVm> transactions;
  const Chart(this.transactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get _last7DaysData {
    return List.generate(7, (index) {
      final date = DateTime.now().subtract(Duration(days: index));

      double totalAmount = 0.0;
      for(var i = 0; i < transactions.length; i++) {
        if(transactions[i].date.day == date.day &&
            transactions[i].date.month == date.month &&
            transactions[i].date.year == date.year
          ) {
          totalAmount += transactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(date).substring(0, 1), 'amount': totalAmount};
    }).reversed.toList();
  }

  double get _totalAmount7Days {
    return transactions.fold(0.0, (previousValue, element) {
      return previousValue += element.amount;
    });
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {

    // print(_totalAmount7Days);

    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _last7DaysData.map((item) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(item['day'].toString(), item['amount'] as double ,
                  _totalAmount7Days == 0.0 ? 0.0 :(item['amount'] as double) / _totalAmount7Days  ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
