import 'package:flutter/material.dart';
import './transactionVm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<TransactionVm> _transactions = [
      TransactionVm(id: 'id1', title: 'baju', amount: 10.12, date: DateTime.now()),
      TransactionVm(id: 'id2', title: 'sepatu', amount: 8.72, date: DateTime.now()),
    ];


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Personal Expenses"),),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
                width: double.infinity,
                child: Card(child: Text('chart'),)
            ),

            Card(child: Text('List of transactions'), color: Colors.amber,),

            Column( children: _transactions.map((item) {
                return Card(child: Text(item.title),);
              }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

