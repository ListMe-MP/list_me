import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/maintitle.dart';
import 'package:list_me/model/SelectedItem.dart';
import 'package:list_me/services/apisug.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../components/top_bar.dart';
import '../services/api.dart';
import '../utils/navigationMenu.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';

class CreateList extends StatefulWidget {
  const CreateList({super.key});

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  int _quntity = 1;
  var titleController = TextEditingController();
  var itemController = TextEditingController();
  List<ListItem> itemList = [];

  // speech to text objects
  var text = "";
  var isListning = false;
  SpeechToText speechToText = SpeechToText();

  void editItem(int index) {
    // Set the item details to the text field for editing
    setState(() {
      itemController.text = itemList[index].itemName;
    });

    // Remove the item from the itemList
    setState(() {
      itemList.removeAt(index);
    });
  }

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

        //edit function, load info to create list page from check list page
        // body: FutureBuilder(
        //   future: Api.getProduct(),
        //   builder: (BuildContext context,AsyncSnapshot snapshot) {
        //     if (snapshot.hasData) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else {
        //       List<Product> pdata = snapshot.data;

        //       return ListView.builder(
        //         itemCount: pdata.length,
        //         itemBuilder: (BuildContext context, int index ) {
        //             return ListTile(
        //               leading: const Icon(Icons.circle)
        //               ltitle: Text("${pdata[index].itemName}"),
        //               subtitle: Text("${pdata[index].desc}"),
        //                trailing: IconButton(
        //                                           onPressed: () {
        //                                             Navigator.push(
        //                                               context,
        //                                               MaterialPageRoute(
        //                                                 builder: (BuildContext
        //                                                     context) {
        //                                                   return CheckList04(
        //                                                       data:
        //                                                           pdata[index]);
        //                                                 },
        //                                               ),
        //                                             );
        //                                           },
        //                                           icon: const Icon(
        //                                               Icons.arrow_forward),
        //                                           color: Colors.black,
        //                                         ) ,
        //             )
        //         },
        //       );
        //     }
        //   };

        body: Stack(
          children: [
            // const Background(),
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
                              // microphone button
                              AvatarGlow(
                                endRadius: 20,
                                animate: isListning,
                                duration: Duration(milliseconds: 2000),
                                glowColor: tc1,
                                repeat: true,
                                repeatPauseDuration:
                                    Duration(milliseconds: 100),
                                showTwoGlows: true,
                                child: GestureDetector(
                                  onTapDown: (details) async {
                                    if (!isListning) {
                                      var available =
                                          await speechToText.initialize();
                                      if (available) {
                                        setState(() {
                                          isListning = true;
                                          speechToText.listen(
                                            onResult: (result) {
                                              text = result.recognizedWords;
                                              itemController.text = text;
                                            },
                                          );
                                        });
                                      }
                                    }
                                  },
                                  onTapCancel: () {
                                    setState(() {
                                      isListning = false;
                                    });
                                    speechToText.stop();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: tf.withOpacity(0.9),
                                    radius: 15,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          isListning
                                              ? Icons.mic
                                              : Icons.mic_off,
                                          color: tc1,
                                          size: 15,
                                        )),
                                  ),
                                ),
                              ),

                              // text field
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TypeAheadField(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      autofocus: false,
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
                                    hideOnLoading: true,
                                    hideOnEmpty: true,
                                    suggestionsCallback: (pattern) =>
                                        SuggestionsApi.getSuggestions(pattern),
                                    itemBuilder: (context, suggestion) {
                                      return ListTile(
                                        title: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Image.asset(
                                                suggestion['item_image'],
                                                fit: BoxFit.cover,
                                                width: 40,
                                                height: 40,
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    10), // Add spacing between image and text
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(suggestion['item_name']),
                                                Text(
                                                  'Rs. ${suggestion['item_price']}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: tc2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    onSuggestionSelected: (suggestion) {
                                      // itemController.text =
                                      //     suggestion['item_name'];
                                      setState(() {
                                        final item = ListItem(
                                            itemName: suggestion['item_name'],
                                            itemImage: suggestion['item_image'],
                                            itemPrice:
                                                suggestion['item_price']);
                                        itemList.add(item);
                                        itemController.clear();
                                      });
                                    },
                                  ),
                                ),
                              ),

                              // add button
                              IconButton(
                                onPressed: () {
                                  print("pressed add button");
                                  if (itemController.text.isNotEmpty) {
                                    setState(() {
                                      final rawItems = itemController.text
                                          .split(RegExp(r'\s*(?:,|and)\s*'));
                                      final parsedItems = <String>[];

                                      for (final rawItem in rawItems) {
                                        if (rawItem.trim().toLowerCase() !=
                                            'and') {
                                          parsedItems.add(rawItem.trim());
                                        }
                                      }

                                      itemList.addAll(parsedItems
                                          .where((item) => item.isNotEmpty)
                                          .map((item) {
                                        return ListItem(
                                            itemName: item,
                                            itemImage:
                                                "assets/images/items/item0.png",
                                            itemPrice: 0);
                                      }));
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
                            final item = itemList[index];
                            return Dismissible(
                              key: Key(item.itemName),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) {
                                // removed the dismissed item from the list
                                setState(() {
                                  itemList.removeAt(index);
                                });
                      
                              },
                              background: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 20),
                                color: tc6,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Container(
                                    color: tf.withOpacity(0.35),
                                    // image of the item
                                    child: ListTile(
                                        leading: Image.asset(
                                          item.itemImage,
                                          fit: BoxFit.cover,
                                        ),

                                        // item name
                                        title: Text(
                                          item.itemName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: tc1),
                                        ),

                                        // item price
                                        subtitle: Row(
                                          children: [
                                            Text(
                                              'Rs. ${item.itemPrice}',
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
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                style:
                                                    const TextStyle(color: tc2),
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.all(8),
                                                    hintText: 'Qty',
                                                    hintStyle: TextStyle(
                                                        color: tc2
                                                            .withOpacity(0.5)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: tc2
                                                                    .withOpacity(
                                                                        0.5)))),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _quntity =
                                                        int.tryParse(value) ??
                                                            0;
                                                  });
                                                },
                                                controller:
                                                    TextEditingController(
                                                        text: _quntity
                                                            .toString()),
                                              ),
                                            )
                                          ],
                                        ),
                                        // edit button
                                        trailing: GestureDetector(
                                          onTap: () {
                                            editItem(index);
                                          },
                                          child: const Icon(
                                            Icons.edit,
                                            color: tc1,
                                          ),
                                        )),
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

                      // Create button
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.all(16),

                        // submit
                        child: RawMaterialButton(
                          onPressed: () {
                            if (titleController.text.isNotEmpty &&
                                itemList.isNotEmpty) {
                              final itemArray = itemList.map((item) {
                                return {
                                  "pname": item.itemName,
                                  "pimage": item.itemImage,
                                  "pprice": item.itemPrice,
                                  "pquantity": _quntity,
                                  "ischecked": false
                                };
                              }).toList();

                              final data = {
                                "ltitle": titleController.text,
                                "items": itemArray,
                                "id": DateTime.now().toString()
                              };

                              Api.addProduct(data);

                              setState(() {
                                itemList.clear();
                              });

                              titleController.clear();
                            }
                          },
                          shape: const CircleBorder(
                              side: BorderSide(color: tc3, width: 5.0)),
                          padding: const EdgeInsets.all(10.0),
                          fillColor: tc1,
                          splashColor: tc2,
                          child: const Icon(
                            Icons.add,
                            color: tc5,
                            size: 40.0,
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}
