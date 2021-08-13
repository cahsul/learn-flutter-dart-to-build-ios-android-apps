import 'package:flutter/material.dart';
import './widgets/transaction_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

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

            TransactionUser()

          ],
        ),
      ),
    );
  }
}

