import 'package:flutter/material.dart';

class MealPage extends StatelessWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal List'),),
      body: Center(child: Text('halaman meals..'),),
    );
  }
}
