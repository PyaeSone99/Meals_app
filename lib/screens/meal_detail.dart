import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen ({super.key,required this.mealDetail});

  final Meal mealDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealDetail.title
        ),
      ),
      body: Image.network(
        mealDetail.imageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      )
    );
  }
}