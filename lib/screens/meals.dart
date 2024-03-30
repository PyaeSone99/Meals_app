import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals ({super.key,required this.title,required this.meals});

  final String title;
  final List<Meal> meals;


  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => Text(
      meals[index].title
      ),
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title
        ),

      ),
      body: content,
    );
  }
}