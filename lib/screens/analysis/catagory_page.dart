import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/itemcard.dart';

import '../../components/top_bar.dart';
import '../../utils/navigationMenu.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Catagory> catagorys = [
    const Catagory(
      item_name: 'Apple_Red',
      quantity: '3',
      amount: '195.0',
    ),
    const Catagory(
      item_name: 'Mango',
      quantity: '2',
      amount: '180.0',
    ),
    const Catagory(
      item_name: 'Orange',
      quantity: '1',
      amount: '55.0',
    ),
    const Catagory(
      item_name: 'Avacado',
      quantity: '1',
      amount: '120.0',
    ),
    const Catagory(
      item_name: 'Pineapple',
      quantity: '1',
      amount: '75.0',
    ),
    const Catagory(
      item_name: 'Banana',
      quantity: '1',
      amount: '40.0',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Analysis",
          style: TextStyle(color: tc1),
          textAlign: TextAlign.justify,
        ),
        backgroundColor: tc4,
        foregroundColor: tc1,
      ),
      body: Stack(children: [
        const Background(),
        Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBar(
                  onToggle: (index) {
                    print('switched to:$index');
                  },
                  onMenuItemSelected: (item) => onSelected(context, item),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Stack(
                    children: [
                      Text(
                        'Fruit',
                        style: GoogleFonts.castoro(
                            fontSize: 35.0,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 5
                              ..color = tc5),
                      ),
                      Text('Fruit',
                          style: GoogleFonts.castoro(
                            fontSize: 35.0,
                            color: tc6,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: 350,
                  height: 90,
                  decoration: ShapeDecoration(
                      color: const Color(0x7FD4D4D4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fruit Item Cost',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          'LKR 665.00',
                          style: TextStyle(
                            fontSize: 35.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0X7fd4d4d4)),
                    height: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: catagorys.length,
                      itemBuilder: (BuildContext context, int index) {
                        final category = catagorys[index];
                        return ItemCrad(
                          item_name: category.item_name,
                          quantity: category.quantity,
                          amount: category.amount,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class CatData {
  CatData(this.item, this.quantity);
  final String item;
  final int quantity;
}

class Catagory {
  final String item_name;
  final String quantity;
  final String amount;

  const Catagory({
    required this.item_name,
    required this.quantity,
    required this.amount,
  });
}
