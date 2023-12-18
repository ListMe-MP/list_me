// import 'dart:convert';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/flushbars.dart';
import 'package:list_me/components/maintitle.dart';
import 'package:list_me/components/top_bar.dart';
import 'package:list_me/screens/Untitled_List_04_page.dart';

import '../services/api.dart';
import '../utils/navigationMenu.dart';
import 'create_list.dart';
// import 'package:http/http.dart' as http;

class CheckList extends StatefulWidget {
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  // List pdata = [];
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    // getTitleFromServer();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
 List? pdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Check List",
          style: TextStyle(color: tc1),
          textAlign: TextAlign.justify,
        ),
        backgroundColor: tc4,
        foregroundColor: tc1,
      ),
      body: FutureBuilder(
          future: Api.getProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (!snapshot.hasData) {
              return Text('You have no any lists to show');
            } else {
             pdata = snapshot.data!.toList();
              print(pdata);

              return Stack(
                children: [
                  // const Background(),
                  Container(
                    child: Column(
                      children: [
                        TopBar(
                          onToggle: (index) {
                            print('switched to:$index');
                          },
                          onMenuItemSelected: (item) =>
                              onSelected(context, item),
                        ),

                        const MainTitle(),
                        //     ElevatedButton(onPressed:
                        //     () async{
                        //     var product = await Api.getProduct();
                        //     print(product);
                        //     }
                        // , child: Text('submit')),
                        pdata!.isEmpty
                            ? Column(
                                children: [
                                  SizedBox(height: 45),
                                  Center(
                                    child: Text(
                                      '" You have no any lists to show. \n Want to create? "',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            20, // Adjust the font size as needed
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return const CreateList();
                                          },
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<
                                              Color>(
                                          tc4), // Change to your desired background color
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Color.fromARGB(255, 1, 1,
                                              1)), // Change to your desired text color
                                    ),
                                    child: Text("Create List"),
                                  )
                                ],
                              )
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: pdata!.length,
                                  itemBuilder: (context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: const Color.fromRGBO(
                                                      131, 193, 193, 1),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 4,
                                                      offset: Offset(0, 4),
                                                      spreadRadius: 0,
                                                    ),
                                                  ]),
                                              child: ListTile(
                                                title: Text(
                                                    pdata![index]['lTitle']),
                                                trailing: IconButton(
                                                  onPressed: () async {
                                                    var amount =
                                                        await openDialog();
                                                        if(amount ==  null||amount.isEmpty) {
                                                          amount='0';
                                                        }
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return CheckList04(
                                                              amount:
                                                                  double.parse(
                                                                      amount!),
                                                              data:
                                                                  pdata![index]);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  icon: const Icon(
                                                      Icons.arrow_forward),
                                                  color: Colors.black,
                                                ),
                                                iconColor: Colors.black,
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) {
                                                    return const CreateList();
                                                  },
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                                Icons.mode_edit_outline_sharp),
                                            color: Colors.black,
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await Api.deleteProduct(
                                                  pdata![index]['id']);

                                              pdata!.removeAt(index);
                                              setState(() {});
                                              // FlushBars()
                                              //     .undo(
                                              //       message:
                                              //           "You still have a chance to undo it",
                                              //       onUndo: () {
                                              //         Navigator.pop(context);
                                              //         pdata.insert(
                                              //             index,
                                              //             pdata
                                              //                 .removeAt(index));
                                              //       },
                                              //       duration: const Duration(
                                              //           seconds: 6),
                                              //     )
                                              //     .show(context);

                                              //   void removeItem(int index) {
                                              //     final Item = items.removeAt(index);

                                              //   key?.currentState.removeItem(
                                              //     index,
                                              //     (context, Animation) => buildItem (items, index)
                                              //   );
                                              //   },
                                            },
                                            icon: const Icon(Icons.delete),
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }

  Future<String?> openDialog() {
    return showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Enter amount you have",
                style: TextStyle(color: tc1),
              ),
              content: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(hintText: 'Enter Amount'),
                onSubmitted: (value) => submit(),
              ),
              actions: [
                TextButton(
                    onPressed: submit,
                    child: Text(
                      'Add Amount',
                      style: TextStyle(color: tc3),
                    ))
              ],
            ));
  }

  void submit() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }

  void saveCheckList( List<dynamic> pdata){
      //  final data = {
      //                   "ltitle": ,
      //                   "items": itemArray,
      //                   "id": DateTime.now().toString()
      //                 };
      print(pdata);
  }
  // buildItem(List<String> pdata int  index) {}
}
