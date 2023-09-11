import 'package:flutter/material.dart';
import '../components/categories_bar.dart';
import '../components/colors.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Categories",
            style: TextStyle(color: tc1),
            textAlign: TextAlign.justify,
          ),
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
      body: Column(
        children: [
          const CategoriesBar(text: "Bakery"),
          const CategoriesBar(text: "Fast Food"),
          const CategoriesBar(text: "Vagetables"),
          const CategoriesBar(text: "Fruit"),
          const CategoriesBar(text: "Dairy"),
  
        Container(
          child: const Row(
            children: [
            ],
          ),
        )
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
        ),
    );
  }
}