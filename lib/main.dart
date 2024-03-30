import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/meals.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0)
  ),
  textTheme: GoogleFonts.latoTextTheme()
);

void main(){
  runApp(const App());
}


class App extends StatelessWidget {
  const App ({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: theme,
      home: const Meals(title: 'Some category', meals: dummyMeals)
    );
  }
}