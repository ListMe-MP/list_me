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
          CategoriesBar(text: "Bakery"),
          CategoriesBar(text: "Fast Food"),
          CategoriesBar(text: "Vagetables"),
          CategoriesBar(text: "Fruit"),
          CategoriesBar(text: "Dairy"),
  
        Container(
          child: Row(
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