import 'package:flutter/material.dart';
import 'package:meals/models/categoryModel.dart';
import 'package:meals/pages/meal/meal_page.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id ,this.title, this.color, {Key? key}) : super(key: key);

  void GotoMealPage(BuildContext context) {
    Navigator.of(context).pushNamed(MealPage.route, arguments: {'id' : this.id, 'title' : this.title } ) ;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GotoMealPage(context),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight,
              colors: [color.withOpacity(0.7), this.color ])
        ),
        child: Text(title),

      ),
    );
  }
}
