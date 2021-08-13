import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactionVm.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionVm> _transactions;
  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Column( children: _transactions.map((item) {
      return Card(
        child: Row(

          children: [
            // == price
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.all(10),
                // width: 80,
                decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2) ),
                child: Text( '\$${item.amount}',
                  style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold ),
                )
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //== title
                Text(item.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),

                // date
                Text( DateFormat.yMMMd().format(item.date),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            )

          ],
        ),
      );
    }).toList(),
    );
  }
}
