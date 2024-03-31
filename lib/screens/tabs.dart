import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/filter.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/main_drawer.dart';

const kInitialFilters = {
    Filter.GlutenFree : false,
    Filter.LactoseFree : false,
    Filter.Vegetarian : false,
    Filter.Vegan : false
  };

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
  Map<Filter,bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      )
    );
  }

  void _toogleMealFavouriteStatus(Meal meal){
    final isExiting = _favouriteMeals.contains(meal);
     if(isExiting){
      setState(() {
        _favouriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer favourite');
      });
      
    }else{
      setState(() {
         _favouriteMeals.add(meal);
         _showInfoMessage('Marked as favourite');
      });
    }
  }

  void _setScreen(String identifier) async{
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(currentFilters: _selectedFilters,),
        )
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;  
      });
     }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.GlutenFree]! && !meal.isGlutenFree){
       return false; 
      }
      if (_selectedFilters[Filter.LactoseFree]! && !meal.isLactoseFree){
       return false; 
      }
      if (_selectedFilters[Filter.Vegetarian]! && !meal.isVegetarian){
       return false; 
      }
      if (_selectedFilters[Filter.Vegan]! && !meal.isVegan){
       return false; 
      }
      return true;
    }).toList();
    Widget activePage = Categories(onToogleFavourite: _toogleMealFavouriteStatus,availableMeal: availableMeals,);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealScreen(meals: _favouriteMeals,onToogleFavourite: _toogleMealFavouriteStatus,);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle
        ),
      ),
      drawer: MainDrawer(onSelectScream: _setScreen,),
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