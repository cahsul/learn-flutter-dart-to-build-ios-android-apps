import 'package:flutter/material.dart';

class TransactionNew extends StatelessWidget {

  final Function(String title, double amount) addNewData;

  final titleController = new TextEditingController();
  final amountController = new TextEditingController();

  TransactionNew(this.addNewData);

  void submitProses() {
    if(titleController.text.isEmpty || amountController.text.isEmpty ) { return; }
    if(double.parse(amountController.text) < 0 ) { return; }
    addNewData(titleController.text, double.parse(amountController.text)) ;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController, onSubmitted: (_) => submitProses(),),
            TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountController, onSubmitted: (_) => submitProses(), keyboardType: TextInputType.numberWithOptions(decimal: true),),
            FlatButton(child: Text('Tambah data'), textColor: Colors.purple,
              onPressed: submitProses,
            ),
          ],
        ),
      ),
    );
  }
}
