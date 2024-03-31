import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/provider/favourite_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen ({super.key,required this.mealDetail});

  final Meal mealDetail;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealDetail.title
        ),
        actions: [
          IconButton(
            onPressed: (){
              final wasAdded = ref.read(favouriteMealsProvider.notifier).toogleMealFavouriteStatus(mealDetail);
               ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded ? 'Meal added as favourite.' : 'Meal removed'),
                  )
                );
            }, 
            icon: const Icon(Icons.star)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              mealDetail.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 14,),
            for (final ingredient in mealDetail.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
            const SizedBox(height: 14,),
             Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 14,),
            for (final step in mealDetail.steps)
              Padding(
                padding : const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }
}