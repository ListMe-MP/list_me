// import 'package:flutter/material.dart';
// import '../components/categories_bar.dart';
// import '../components/colors.dart';


// class CategoriesPage extends StatelessWidget {
//   const CategoriesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text(
//             "Categories",
//             style: TextStyle(color: tc1),
//             textAlign: TextAlign.justify,
//           ),
//           backgroundColor: tc4,
//           foregroundColor: tc1,
//         ),
//       body: Column(
//         children: [
//           const CategoriesBar(text: "Bakery"),
//           const CategoriesBar(text: "Fast Food"),
//           const CategoriesBar(text: "Vagetables"),
//           const CategoriesBar(text: "Fruit"),
//           const CategoriesBar(text: "Dairy"),
  
//         Container(
//           child: const Row(
//             children: [
//             ],
//           ),
//         )
          
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){},
//         child: const Icon(Icons.add),
//         ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../components/categories_bar.dart';
import '../components/colors.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late TextEditingController _categoryController;
  List<String> categories = ['Bakery', 'Fast Food', 'Vegetables', 'Fruit', 'Dairy'];

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Existing categories
            for (String category in categories)
              CategoriesBar(text: category),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _showAddCategoryDialog();
                        },
                        icon: Icon(Icons.add),
                        label: Text("Add Category"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog() {
    _categoryController.text = ''; // Clear previous text
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category Name'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                      _addCategory();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _addCategory() {
    String category = _categoryController.text.trim();
    if (category.isNotEmpty) {
      // Add the category to the list
      setState(() {
        categories.add(category);
      });

      // feedback message 
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Category added: $category'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      _showEmptyCategoryDialog();
    }
  }

  void _showEmptyCategoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Please add a category.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the error dialog
                Future.delayed(Duration.zero, () {
                  _showAddCategoryDialog(); // Navigate back to the add category dialog
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
