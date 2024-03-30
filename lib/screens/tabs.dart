import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen ({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {

  int _selectedPageIndex = 0;


  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Meal> _favouriteMeals = [];

  void _toogleMealFavouriteStatus(Meal meal){
    final isExiting = _favouriteMeals.contains(meal);
    if(isExiting){
      _favouriteMeals.remove(meal);
    }else{
      _favouriteMeals.add(meal);
    }
    print(_favouriteMeals);
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = Categories(onToogleFavourite: _toogleMealFavouriteStatus,);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealScreen(meals: [],onToogleFavourite: _toogleMealFavouriteStatus,);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favourites')
        ],
      ),
    );
  }
}