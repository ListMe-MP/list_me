

import 'package:flutter/material.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/flushbars.dart';
import 'package:list_me/components/maintitle.dart';
import 'package:list_me/components/top_bar.dart';
import 'package:list_me/screens/Untitled_List_04_page.dart';

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
      appBar: AppBar(title: const Text("Check List", style: TextStyle(color: tc1),textAlign: TextAlign.justify,),
      backgroundColor: tc4,
          foregroundColor: tc1,
      ),
      body: Stack(
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
                            itemCount: items.length ,
                            itemBuilder: (context, int index) { 
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
                                        title: Text(items[index]),
                                        trailing:  IconButton(onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                           return CheckList04(data:items[index]);
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
                                  final temp = items.removeAt(index);
                                  FlushBars().undo(
                                    message: "You still have a chance to undo it",
                                    onUndo: () {
                                      Navigator.pop (context);
                                      items.insert(index, temp); 

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
      ),
    );
  }
  
  buildItem(List<String> items, int index) {}
}