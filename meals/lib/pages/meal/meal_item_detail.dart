import 'package:flutter/material.dart';
import 'package:meals/models/MealModel.dart';

class MealItemDetail extends StatelessWidget {
  static String route = 'meal-item-detail';

  const MealItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;

    return Scaffold(
      body: Center(child: Text('meal-item-detail ${meal.title}'),),
    );
  }
}
