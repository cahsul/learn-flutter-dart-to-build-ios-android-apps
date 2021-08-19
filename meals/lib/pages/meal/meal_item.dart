import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/MealModel.dart';
import 'package:meals/pages/meal/meal_item_detail.dart';

class MealItem extends StatelessWidget {
  final MealModel meal;
  const MealItem(this.meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MealItemDetail.route, arguments: meal ),

      child: Card(

        child: Column(
          children: [

            Stack(
              children: [
                Image.network(meal.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover,),

                Positioned(
                  bottom: 20, right: 10,
                  child: Container(
                    color: Colors.black54, width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text(meal.title,
                      softWrap: true,
                      style: TextStyle(color: Colors.white, fontSize: 28,),
                    ),
                  ),
                ),


              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text('${describeEnum(meal.complexity)} ')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text('${describeEnum(meal.affordability)} ')
                    ],
                  )

                ],
              ),
            )

          ],
        ),

      ),
    );
  }
}
