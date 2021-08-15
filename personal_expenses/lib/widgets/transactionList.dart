import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactionVm.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionVm> _transactions;
  final Function(String id) _deleteData;
  TransactionList(this._transactions, this._deleteData);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty ?
    LayoutBuilder(builder: (context, builder) {
      return Column(
        children: [
          Text('data kosing nih..', style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 20,),
          Container(
            height: builder.maxHeight * 0.7,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
          )
        ],
      );
    })


      : ListView.builder(
      itemCount: _transactions.length,
      itemBuilder: (ctx, i) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text(_transactions[i].title, style: Theme.of(context).textTheme.headline6,),
            subtitle: Text(DateFormat.yMMMd().format(_transactions[i].date), style: TextStyle(fontSize: 12, color: Colors.grey)),
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(child: Text('\$${_transactions[i].amount.toStringAsFixed(2)}')),
              ),
            ),

            trailing: IconButton(
              icon: Icon( Icons.delete),
              onPressed: () => this._deleteData(_transactions[i].id),
              color: Theme.of(context).errorColor, ),

          ),
        );
      },
    );
  }
}
