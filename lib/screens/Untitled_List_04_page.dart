

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/screens/create_list.dart';

import '../components/background.dart';
import '../components/colors.dart';
import '../components/maintitle.dart';
import '../components/top_bar.dart';
import '../utils/navigationMenu.dart';
import 'Settings_page.dart';

class CheckList04 extends StatefulWidget {
  String? data;
   CheckList04({super.key,this.data});

   final List<Map<String, dynamic>> foodItems = [
    {"foodItems": "Suger 1kg", "ischecked": false},
    {"foodItems": "Freash Milk", "ischecked": false},
    {"foodItems": "White Chocolate", "ischecked": false},
     {"foodItems": "Ice Cream", "ischecked": false},
      {"foodItems": "Baking Soda", "ischecked": false},
    // ... Add more items here
];

  // List<String>foodItems = [
  //   'Suger 1kg',
  //   'Fresh milk',
  //   'White Chocolate',
  //   'Vanila',
  //   'Ice Cream',
  //   'Baking Soda',
  // ];

  @override
  State<CheckList04> createState() => _CheckList04State();
}

class _CheckList04State extends State<CheckList04> {
  bool? isChecked = false;
  
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Background(),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TopBar(onToggle: (index) {
                          print('switched to:$index');
                        },
                        onMenuItemSelected: (item) => onSelected(context, item),
                        ), 

                      Stack(
                       children: <Widget>[
          // Stroked text as border.
          Text(
           widget.data!,
            style: GoogleFonts.castoro(
              fontSize: 25,
              shadows: [
                Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2, -2))
              ],
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 5
                ..color = tc5,
            ),
          ),
          // Solid text as fill.
          Text(
            widget.data!,
            style: GoogleFonts.castoro(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
       Container(
         margin: EdgeInsets.only(right: 10),
         width: double.infinity,
         child: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
            return CreateList();
           },),);
         }, 
           icon: Icon(Icons.mode_edit_outline_sharp),
           color: Colors.black,
           alignment: Alignment.topRight,
             ),
       ), 
      
         
          Expanded(
            child: ListView.builder(
              itemCount: widget.foodItems.length,
              itemBuilder: (context, index) {
                return Container(
                   margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
         decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(131, 193, 193, 1),
        boxShadow: [
        BoxShadow(
       color: Colors.black,
         blurRadius: 4,
        offset: Offset(0, 4),
         spreadRadius: 0,
         ),
          ]
         ),
              //     child: ListTile(
              // title: Text(widget.foodItems[index]['foodItems']),
              //   trailing: Checkbox(
              //    value: widget.foodItems[index]['ischecked'],
              //       activeColor: Color.fromARGB(255, 69, 124, 243),
              //      tristate: true, // Fix typo here
              //     onChanged: (newBool) {
              //     setState(() {
              //         widget.foodItems[index]['ischecked'] = newBool;
              //              });
              //              },
              //              ),
              child: ListTile(
              title: Text(widget.foodItems[index]['foodItems']),
                trailing: Checkbox(
                 value: widget.foodItems[index]['ischecked']== true,
                    activeColor: Color.fromRGBO(131, 193, 193, 1),
                    checkColor: Colors.black,
                   tristate: true, // Fix typo here
                  onChanged: (newBool) {
                  setState(() {
                     if (newBool == null || newBool) { 
                      widget.foodItems[index]['ischecked'] = newBool;
                   } });
                           },
                           ),
                            
                             ),
                           );
                          },
                       ),
                    ), 
                  ],
                 ),
               ),

            ], 
          ), 
        );  
     }
}