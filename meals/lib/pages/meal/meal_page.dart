import 'package:flutter/material.dart';
import 'package:meals/pages/meal/meal_item.dart';
import '../../data/MealDummy.dart';

class MealPage extends StatelessWidget {
  static String route = 'meal-list';
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'].toString();
    final id = routeArgs['id'];

    final filterMeals = DUMMY_MEALS.where((item) {
      return item.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: ListView.builder(
        itemCount: filterMeals.length,
        itemBuilder: (ctx, i) {
          print(filterMeals.length);
          return MealItem(filterMeals[i]);
        },
      ),
    );
  }
}
