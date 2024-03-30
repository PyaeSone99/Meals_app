import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories ({super.key});

  void _selectedCategory(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(builder: 
        (context) => MealScreen(title: 'Some Title', meals: []),
      )
    );
  }

  @override
  Widget build(context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your category'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3/2,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList(), alternative way
          for (final category in availableCategories)
            CategoryGridItem(category: category,onSelectCategory: (){
               _selectedCategory(context);
            },)
        ],
        ),
      );
  }
}
