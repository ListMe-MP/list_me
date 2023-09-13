

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/flushbars.dart';
import 'package:list_me/components/maintitle.dart';
import 'package:list_me/components/top_bar.dart';
import 'package:list_me/model/product_model.dart';
import 'package:list_me/screens/Untitled_List_04_page.dart';
import 'package:list_me/services/api.dart';

import '../utils/navigationMenu.dart';
import 'create_list.dart';
import 'package:http/http.dart' as http;

class CheckList extends StatefulWidget {
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  List<String> items = [];

  // @override
  // void initState() {
  //   super.initState();
  //   getTitleFromServer();
  // }

  // Future<void> fetchDataFromServer() async {
  //   try {         
  //     // Replace 'YOUR_API_ENDPOINT' with the actual endpoint to fetch data
  //     final response = await http.get(Uri.parse("http://localhost:2000/api/get_product/"));

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       if (data is List) {
  //         // Assuming the server returns a list of strings
  //         setState(() {
  //           items = List<String>.from(data);
  //         });
  //       } else {
  //         // Handle the response if it's not a list of strings
  //       }
  //     } else {
  //       // Handle errors or non-200 status codes
  //     }
  //   } catch (e) {
  //     // Handle any exceptions that occur during the HTTP request
  //     print('Error: $e');
  //   }
  // }

//   Future<List<String>> getTitleFromServer() async {
//   var url = Uri.parse("http://localhost:2000/api/get_product/");
//   late http.Response response;

//   try {
//     response = await http.get(url);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> title = jsonDecode(response.body);
//       List<dynamic> titleName = title["results"];

//       List<String> ltitles = [];

//       for (var item in titleName) {
//         var id = item['id'];
//         var ltitle = item['ltitle'];
//         ltitles.add(ltitle);
//       }

//       setState(() {
//         items = ltitles;
//       });

//       return items;
//     } else {
//       return Future.error("Something went wrong, ${response.statusCode}");
//     }
//   } catch (e) {
//     return Future.error(e.toString());
//   }
// }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check List", style: TextStyle(color: tc1),textAlign: TextAlign.justify,),
      backgroundColor: tc4,
          foregroundColor: tc1,
      ),
      body: 
    FutureBuilder <List<Product>>(
    future: Api.getProduct(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      // Show a loading indicator while data is being fetched.
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      // Handle the error case.
      return Text('Error: ${snapshot.error}');
    } else if (snapshot.data != null) {
      // Handle the case where data is null.
      return Text('No data available.');
    } else if (snapshot.data!.isEmpty) {
      // Handle the case where data is an empty list.
      return Text('No products available.');
    } else {
      // Data is available, you can safely access snapshot.data.
      List <Product> pdata = snapshot.data!;
      return Stack(
            children: [
              const Background(),
              Container(
                child: Column(
                  children: [
                    TopBar(onToggle: (index) {
                              print('switched to:$index');
                            },
                            onMenuItemSelected: (item) => onSelected(context, item),
                            ),
      
                            const MainTitle(),
                           Expanded(child:   ListView.builder(
                                itemCount: pdata.length ,
                                itemBuilder: (BuildContext context, int index) { 
                                return   Container(
                                          margin: const EdgeInsets.fromLTRB(0, 0,0, 10),
                                          child: Row(
                                           children: [
                                            Expanded( child:
                                             Container(
                                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color.fromRGBO(131, 193, 193, 1),
                                         boxShadow: const [
                                        BoxShadow(
                                         color: Colors.black,
                                         blurRadius: 4,
                                        offset: Offset(0, 4),
                                          spreadRadius: 0,
                                          ),
                                        ]
                                         ),
                                          
                                           child: ListTile(
                                            title: Text(pdata[index].listTitle!),
                                            trailing:  IconButton(onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                               return CheckList04(data:pdata[index].itemName);
                                              },),);
                                            }, 
                                       icon: const Icon(Icons.arrow_forward),
                                         color:Colors.black,
                                         ),
                                            iconColor: Colors.black,
                                            onTap: () {},
                                          ),
                                     ),
                                     
                                     ),
                                      IconButton(onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                           return const CreateList();
                                        },),);
                                      }, 
                                     icon: const Icon(Icons.mode_edit_outline_sharp),
                                      color:Colors.black,
                                  ),
                                    IconButton(onPressed: () {
                                      final temp = pdata.removeAt(index);
                                      FlushBars().undo(
                                        message: "You still have a chance to undo it",
                                        onUndo: () {
                                          Navigator.pop (context);
                                          pdata.insert(index, temp); 
      
                                        },
                                        duration: const Duration(seconds: 6),
                                      ). show (context);
      
      
                                      // void removeItem(int index) {
                                      //   final Item = items.removeAt(index);
      
                                   
                                      // key?.currentState.removeItem(
                                      //   index, 
                                      //   (context, Animation) => buildItem (items, index)
                                      // );
                                      // },
                                    }, 
                                   icon: const Icon(Icons.delete),
                                   color:Colors.black,
                                 ),
                                     ],
                                   ),
                                  );
                                },
                               ),)
                          
      
      
                    
                  ],
                ),
              ),
            ],
          );
          }
        }
      ),
    );
  }
  
  buildItem(List<String> pdata, int index) {}
}