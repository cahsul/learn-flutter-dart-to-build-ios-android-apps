import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
                width: double.infinity,
                child: Card(child: Text('chart'),)
            ),

            // FORM
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(decoration: InputDecoration(labelText: 'Title'),),
                    TextField(decoration: InputDecoration(labelText: 'Amount'),),
                    FlatButton(onPressed: () {}, child: Text('Tambah data'), textColor: Colors.purple,),
                  ],
                ),
              ),
            ),

            Column( children: _transactions.map((item) {
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
              ),
          ],
        ),
      ),
    );
  }
}

