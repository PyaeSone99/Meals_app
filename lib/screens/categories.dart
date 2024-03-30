import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories ({super.key});

  @override
  Widget build(context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your category'),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3/2,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
        children: const [
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
        ],
        ),
      );
  }
}
