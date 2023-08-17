import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/maintitle.dart';
import 'package:list_me/components/top_bar.dart';

import '../utils/navigationMenu.dart';

class CheckList extends StatelessWidget {
  const CheckList({super.key});
  
  get child => null;

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
                                      
                                      
                                    child: Container(
                                      color:Colors.black12,
                                      child: ListTile(
                                        title: Text('Untitled list 01 '),
                                        trailing: Icon(Icons.arrow_forward),
                                        onTap: () {},
                                      ),
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
                                      
                                    child: Container(
                                      color:Colors.black12,
                                      child: ListTile(
                                        title: Text('Untitled list 02 '),
                                        trailing: Icon(Icons.arrow_forward),
                                        onTap: () {},
                                      ),
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
                                    child: Container(
                                      color:Colors.black12,
                                      child: ListTile(
                                        title: Text('Untitled list 03 '),
                                        trailing: Icon(Icons.arrow_forward),
                                        onTap: () {},
                                      ),
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
                                    child: Container(
                                      color:Colors.black12,
                                      child: ListTile(
                                        title: Text('Untitled list 04 '),
                                        trailing: Icon(Icons.arrow_forward),
                                        onTap: () {},
                                      ),
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
}