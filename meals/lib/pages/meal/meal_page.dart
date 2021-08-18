import 'package:flutter/material.dart';

class MealPage extends StatelessWidget {
  static String route = 'meal-list';
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'].toString();
    final id = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(child: Text('halaman meals..'),),
    );
  }
}
