import 'package:flutter/material.dart';

class TransactionNew extends StatelessWidget {

  final titleController = new TextEditingController();
  final amountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController,),
            TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountController,),
            FlatButton(onPressed: () {}, child: Text('Tambah data'), textColor: Colors.purple,),
          ],
        ),
      ),
    );
  }
}
