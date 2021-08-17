import 'package:flutter/material.dart';
import 'package:meals/data/categoryDummy.dart';
import 'package:meals/pages/category/category_item.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Kategori'),),
      body: GridView(
        padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),

          children: DUMMY_CATEGORIES.map((item) {
            return CategoryItem(item.title, item.color);
          }).toList(),
      ),
    );
  }
}
