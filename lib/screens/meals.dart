import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_items.dart';

class MealScreen extends StatelessWidget {
  const MealScreen ({super.key,this.title,required this.meals,required this.onToogleFavourite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToogleFavourite;


  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItems(meal: meals[index],onToogleFavourite: onToogleFavourite,)
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground ,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try seleting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!
        ),

      ),
      body: content,
    );
  }
}