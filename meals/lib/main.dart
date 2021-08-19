import 'package:flutter/material.dart';
import 'package:meals/pages/meal/meal_item_detail.dart';
import './pages/meal/meal_page.dart';
import 'pages/category/categories_page.dart';
import './app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1)
      ),
      routes: {
        '/' : (ctx) => CategoriesPage(),
        MealPage.route : (ctx) => MealPage(),
        MealItemDetail.route: (ctx) => MealItemDetail()
      } ,
    );
  }
}
