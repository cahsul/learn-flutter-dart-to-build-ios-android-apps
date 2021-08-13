import 'package:flutter/material.dart';
import '../models/transactionVm.dart';
import './transactionList.dart';
import './transaction_new.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final List<TransactionVm> _transactions = [
    TransactionVm(id: 'id1', title: 'baju', amount: 10.12, date: DateTime.now()),
    TransactionVm(id: 'id2', title: 'sepatu', amount: 8.72, date: DateTime.now()),
  ];

  void _addNewData(String title, double amount) {
    var newData = new TransactionVm(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now()
    );

    setState(() {
      _transactions.add(newData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionNew(_addNewData),
        TransactionList(_transactions),
      ],
    );
  }
}
