import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactionVm.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionVm> _transactions;
  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 500,
      child: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: Row(

              children: [
                // == price
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(10),
                    // width: 80,
                    decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor, width: 2) ),
                    child: Text( '\$${_transactions[i].amount.toStringAsFixed(2)}',
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.bold ),
                    )
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //== title
                    Text(_transactions[i].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),

                    // date
                    Text( DateFormat.yMMMd().format(_transactions[i].date),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
