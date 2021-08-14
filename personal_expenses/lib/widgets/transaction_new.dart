import 'package:flutter/material.dart';

class TransactionNew extends StatefulWidget {

  final Function(String title, double amount) addNewData;


  TransactionNew(this.addNewData);

  @override
  _TransactionNewState createState() => _TransactionNewState();
}

class _TransactionNewState extends State<TransactionNew> {
  final titleController = new TextEditingController();

  final amountController = new TextEditingController();

  void submitProses() {
    if(titleController.text.isEmpty || amountController.text.isEmpty ) { return; }
    if(double.parse(amountController.text) < 0 ) { return; }
    widget.addNewData(titleController.text, double.parse(amountController.text)) ;

    Navigator.of(context).pop();
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
