import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/provider/favourite_provider.dart';
import 'package:meal/provider/meals_provider.dart';
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

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen ({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {

  int _selectedPageIndex = 0;


  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Map<Filter,bool> _selectedFilters = kInitialFilters;


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
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
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
    Widget activePage = Categories(availableMeal: availableMeals,);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealScreen(meals: favouriteMeals);
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