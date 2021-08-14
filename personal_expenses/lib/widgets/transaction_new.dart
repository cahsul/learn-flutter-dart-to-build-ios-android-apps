import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionNew extends StatefulWidget {

  final Function(String title, double amount, DateTime selectedDate) addNewData;


  TransactionNew(this.addNewData);

  @override
  _TransactionNewState createState() => _TransactionNewState();
}

class _TransactionNewState extends State<TransactionNew> {
  final titleController = new TextEditingController();
  final amountController = new TextEditingController();
  DateTime? _dateSelected;

  void submitProses() {
    if(titleController.text.isEmpty || amountController.text.isEmpty || _dateSelected == null ) { return; }
    if(double.parse(amountController.text) < 0 ) { return; }

    widget.addNewData(titleController.text, double.parse(amountController.text), _dateSelected!) ;

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
    .then((value) {
      if(value == null) return;

      setState(() {
        _dateSelected = value;
      });
    });
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
            Row(children: [
              Expanded(child: Text( _dateSelected == null ? 'pilih tanggal' : DateFormat.yMMMd().format(_dateSelected!) )),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Choose Date'),
                onPressed: _showDatePicker, )
            ],),
            RaisedButton(child: Text('Tambah data'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button!.color,
              onPressed: submitProses),
          ],
        ),
      ),
    );
  }
}
