

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/flushbars.dart';
import 'package:list_me/components/itemcard.dart';
import 'package:list_me/components/maintitle.dart';
import 'package:list_me/components/top_bar.dart';
import 'package:list_me/screens/Untitled_List_04_page.dart';

import '../components/flushbars.dart';
import '../utils/navigationMenu.dart';
import 'create_list.dart';

class CheckList extends StatelessWidget {
   CheckList({super.key});
  
  

  List<String> items=[
    'Untitle list 04',
    'Untitle list 03',
    'Untitle list 02',
    'Untitle list 01',
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check List", style: TextStyle(color: tc1),textAlign: TextAlign.justify,),
      backgroundColor: tc4,
          foregroundColor: tc1,
      ),
      body: Stack(
        children: [
          Background(),
          Container(
            child: Column(
              children: [
                TopBar(onToggle: (index) {
                          print('switched to:$index');
                        },
                        onMenuItemSelected: (item) => onSelected(context, item),
                        ),

                        MainTitle(),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget> [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                    child: ListTile(
                                      title: Text('Untitled list 01 '),
                                      trailing: Icon(Icons.arrow_forward),
                                      onTap: () {},
                                    ),),
                                    IconButton(onPressed: () {}, 
                                    icon: Icon(Icons.mode_edit_outline_sharp),
                                    color:Colors.black,
                                    ),
                                    IconButton(onPressed: () {}, 
                                    icon: Icon(Icons.delete),
                                    color:Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                             
                                 Row ( 
                                  children: <Widget> [
                                    Expanded(
                                    child: ListTile(
                                      title: Text('Untitled list 02 '),
                                      trailing: Icon(Icons.arrow_forward),
                                      onTap: () {},
                                    ),),
                                    IconButton(onPressed: () {}, 
                                    icon: Icon(Icons.mode_edit_outline_sharp),
                                    color:Colors.black,
                                    ),
                                    IconButton(onPressed: () {}, 
                                    icon: Icon(Icons.delete),
                                    color:Colors.black,
                                                  ), 
                            ],
                                ),
                              
                              Divider(),
                              
                                 Row(
                                  children: [
                                    Expanded(
                                    child: ListTile(
                                      title: Text('Untitled list 03 '),
                                      trailing: Icon(Icons.arrow_forward),
                                      onTap: () {},
                                    ),),
                                    IconButton(onPressed: () {}, 
                                    icon: Icon(Icons.mode_edit_outline_sharp),
                                    color:Colors.black,
                                    ),
                                    IconButton(onPressed: () {}, 
                                    icon: Icon(Icons.delete),
                                    color:Colors.black,
                                    ),
                                  ],
                                ),
                              
                               Divider(),
                             
                                Row(
                                  children: [
                                    Expanded(
                                    child: ListTile(
                                      title: Text('Untitled list 04 '),
                                      trailing: Icon(Icons.arrow_forward),
                                      onTap: () {},
                                    ),),
                                    IconButton(onPressed: () {}, 
                                    icon: Icon(Icons.mode_edit_outline_sharp),
                                    color:Colors.black,
                                    ),
                                    IconButton(onPressed: () {}, 
                                    icon: Icon(Icons.delete),
                                    color:Colors.black,
                                    ),
                                  ],
                                ),
                              
                              

                            ],
                          ),
                        ),
                       



                
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  buildItem(List<String> items, int index) {}
}