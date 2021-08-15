import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transactionList.dart';
import './widgets/transaction_new.dart';
import 'models/transactionVm.dart';

void main() {
  runApp(FirstRun());
}


class FirstRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyApp(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,

        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          button: TextStyle( color: Colors.white)
        ),

        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )
          )
        ),

      ),


    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<TransactionVm> _transactions = [
    // TransactionVm(id: 'id1', title: 'baju', amount: 30, date: DateTime.now()),
    // TransactionVm(id: 'id2', title: 'sepatu', amount: 20, date: DateTime.now().subtract(Duration(days: 1))),
    // TransactionVm(id: 'id2', title: 'sepatu', amount: 50, date: DateTime.now().subtract(Duration(days: 2)) ),
  ];

  List<TransactionVm> get _last7DaysTransaction {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewData(String title, double amount, DateTime transactionDate) {
    var newData = new TransactionVm(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: transactionDate
    );

    setState(() {
      _transactions.add(newData);
    });
  }

  void _deleteData(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }


  void _showAddModal(BuildContext ctx) {
    print(ctx.toString());
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return TransactionNew(_addNewData);
      },
    );

  }


  @override
  Widget build(BuildContext context) {

    final _isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final _appBar = AppBar(
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () => _showAddModal(context),
        )
      ],
    );

    final _heightArea = MediaQuery.of(context).size.height
        - _appBar.preferredSize.height
        - MediaQuery.of(context).padding.top ;

    final chartWidget =
    Container(
      height: _heightArea * 0.4,
      // margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Chart(_last7DaysTransaction),);

    final transactionListWidget =
    Container(
        height: _heightArea * 0.6,
        child: TransactionList(_transactions, _deleteData));

    return Scaffold(
      appBar: _appBar,

      body: SingleChildScrollView(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              chartWidget,
              transactionListWidget
            ],
          )
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton( child: Icon(Icons.add) , onPressed: () => _showAddModal(context),),
    );
  }
}

