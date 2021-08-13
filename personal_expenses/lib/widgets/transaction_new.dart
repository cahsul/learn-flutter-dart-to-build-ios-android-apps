import 'package:flutter/material.dart';

class TransactionNew extends StatelessWidget {

  final Function(String title, double amount) addNewData;

  final titleController = new TextEditingController();
  final amountController = new TextEditingController();

  TransactionNew(this.addNewData);

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
            FlatButton(child: Text('Tambah data'), textColor: Colors.purple,
              onPressed: () {
                addNewData(titleController.text, double.parse(amountController.text)) ;
              },
            ),
          ],
        ),
      ),
    );
  }
}
