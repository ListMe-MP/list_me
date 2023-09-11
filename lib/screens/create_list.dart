import 'package:flutter/material.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/maintitle.dart';
import '../components/top_bar.dart';
import '../services/api.dart';
import '../utils/navigationMenu.dart';

class CreateList extends StatefulWidget {
  const CreateList({super.key});

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  int _quntity = 1;
  var titleController = TextEditingController();
  var itemController = TextEditingController();
  List<String> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create List",
            style: TextStyle(color: tc1),
            textAlign: TextAlign.justify,
          ),
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
        body: Stack(
          children: [
            const Background(),
            Container(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // TopBar
                      TopBar(
                        onToggle: (index) {
                          print('switched to:$index');
                        },
                        onMenuItemSelected: (item) => onSelected(context, item),
                      ),

                      // title
                      const MainTitle(),

                      // textfield for title of the list
                      Container(
                        width: 350,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: tf,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              hintText: "Untitled list-1",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      // text field for type the list items
                      Container(
                          width: 350,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: tf.withOpacity(0.75),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: TextField(
                                    controller: itemController,
                                    decoration: const InputDecoration(
                                      hintText: "Type Here",
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 15,
                                        fontFamily: 'Castoro',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // add button
                              IconButton(
                                onPressed: () {
                                  if (itemController.text.isNotEmpty) {
                                    setState(() {
                                      final rawItems = itemController.text
                                          .split(RegExp(r'[,\s]'));
                                      final parsedItems = <String>[];

                                      for (final rawItem in rawItems) {
                                        if (rawItem.trim().toLowerCase() !=
                                            'and') {
                                          parsedItems.add(rawItem.trim());
                                        }
                                      }

                                      itemList.addAll(parsedItems
                                          .where((item) => item.isNotEmpty));
                                      itemController.clear();
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.add_box_outlined,
                                  color: tc1,
                                ),
                              )
                            ],
                          )),

                      const SizedBox(
                        height: 5,
                      ),

                      // item list

                      Container(
                        width: 350,
                        height: 390,
                        decoration: ShapeDecoration(
                          color: tf.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: itemList.length,
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Container(
                                  color: tf.withOpacity(0.35),
                                  // image of the item
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/items/item0.png',
                                      fit: BoxFit.cover,
                                    ),
                              
                                    // item name
                                    title: Text(
                                      itemList[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: tc1),
                                    ),
                              
                                    // item price
                                    subtitle: Row(
                                      children: [
                                        const Text(
                                          '\$ 20',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: tc2),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        // quantity
                                        SizedBox(
                                          width: 60,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(color: tc2),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(8),
                                                hintText: 'Qty',
                                                hintStyle: TextStyle(
                                                    color: tc2.withOpacity(0.5)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: tc2
                                                            .withOpacity(0.5)))),
                                            onChanged: (value) {
                                              setState(() {
                                                _quntity =
                                                    int.tryParse(value) ?? 0;
                                              });
                                            },
                                            controller: TextEditingController(
                                                text: _quntity.toString()),
                                          ),
                                        )
                                      ],
                                    ),
                                    // edit button
                                    trailing: const Icon(
                                      Icons.edit,
                                      color: tc1,
                                    ),
                                    onTap: () {
                                      // Add your onTap logic here
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          // separatorBuilder: (context, index) {
                          //   return SizedBox(
                          //       height:
                          //           10); // Adjust the height as per your padding needs
                          // },
                          // itemCount: 10,
                          scrollDirection: Axis
                              .vertical, // Replace this with the number of ListTiles you want
                        ),
                      ),
                    ]),
              ),
            ),

            // Create button
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(2, 2))
                  ],
                  shape: BoxShape.circle,
                ),

                // submit
                child: RawMaterialButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        itemList.isNotEmpty) {
                      print("itemList: $itemList");
                      var data = {
                        "ltitle": titleController.text,
                        "items": itemList,
                      };

                      Api.addProduct(data);

                      setState(() {
                        itemList.clear();
                      });

                      titleController.clear();
                    }
                  },
                  shape: const CircleBorder(side: BorderSide(color: tc3, width: 5.0)),
                  padding: const EdgeInsets.all(10.0),
                  fillColor: tc1,
                  splashColor: tc2,
                  child: const Icon(
                    Icons.add,
                    color: tc5,
                    size: 40.0,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}




