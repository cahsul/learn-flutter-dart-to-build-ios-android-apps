import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}

