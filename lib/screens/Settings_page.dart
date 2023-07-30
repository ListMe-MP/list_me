


import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:list_me/data/menu_items.dart';
import 'package:list_me/model/menu_item.dart';
import 'package:google_fonts/google_fonts.dart';



class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
      
            const Background(),
      
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back),
                        
                       ToggleSwitch(
                        borderColor: [tc3],
                        minWidth: 70.0,
                        minHeight: 20,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [tc1],
                          [tc3]
                        ],
                        activeFgColor: ttc1,
                        inactiveBgColor: tc4,
                        inactiveFgColor: tc1,
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        labels: ['Voice', ' enable'],
                        radiusStyle: true,
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                        ),

                        // PopupMenuButton<MenuItem>(
                        //   icon: Icon(
                        //     Icons.menu_rounded,
                        //     color: tc1,
                        //     size: 36,
                        //   ),
                        //   onSelected: (item) => onSelected(context, item),
                        //   itemBuilder: (context) => [
                        //     ...MenuItems.itemsFirst.map(buildItem).toList(),
                        //   PopupMenuDivider(),
                        //   ...MenuItems.itemsSecond.map(buildItem).toList(),
                        // ])
                      ],
                    ),

                    const SizedBox(
                      height: 50,
                    ),

                    // Text(
                    //   "Settings",
                    //   style: GoogleFonts.castoro(
                    //     fontSize: 40, 
                    //     fontWeight: FontWeight.w400, 
                    //     shadows: [
                    //       Shadow(
                    //         offset: Offset(2, -2),
                    //         blurRadius: 4,
                    //       ),
                    //     ],
                    //     color: Color.fromRGBO(1, 229, 217, 1),
    
                    //   ),
                    // ),


            Padding(
              padding: EdgeInsets.only(top: 60.0),
                child: Stack(
                  children: <Widget>[
                // Stroked text as border.
                    Text(
                      'Settings',
                          style: GoogleFonts.castoro(
                            fontSize: 40,
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
                      'Settings',
                      style: GoogleFonts.castoro(
                      fontSize: 40,
                      color: tc6,
                    ),
                    ),
                  ],
                ),
            ),



                //   Text(
                //   'Settings',
                //   style: GoogleFonts.castoro(
                //     fontSize: 40,
                //     shadows: [
                //       Shadow(
                //           blurRadius: 10.0,
                //           color: Colors.black,
                //           offset: Offset(2, -2))
                //     ],
                //     foreground: Paint()
                //       ..style = PaintingStyle.stroke
                //       ..strokeWidth = 5
                //       ..color = tc5,
                //   ),
                // ),
                // // Solid text as fill.
                // Text(
                //   'Settings',
                //   style: GoogleFonts.castoro(
                //     fontSize: 40,
                //     color: tc6,
                //   ),
                // ),

      
                    const SizedBox(
                      height: 50,
                    ),
      
                    Container(
                      width: 299,
                      height: 40,
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
                      
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Ionicons.person_outline, 
                              color: Colors.black,
                              ),
                          ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Profile", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                            ),
                            Spacer(),
                            Icon(
                              Ionicons.chevron_forward, 
                              color: Colors.black,
                            ),   
                        ],
                      ),
                    ),
      
                    const SizedBox(
                      height: 10,
                    ),
            
                    Container(
                      width: 299,
                      height: 40,
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
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Ionicons.notifications_outline, 
                              color: Colors.black,
                            ),
                          ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Notifications", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                            ),
                            Spacer(),
                            Icon(
                              Ionicons.chevron_forward, 
                              color: Colors.black,
                            ),   
                        ],
                      ),
                    ),
            
                    const SizedBox(
                      height: 10,
                    ),
            
                    Container(
                      width: 299,
                      height: 40,
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
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Ionicons.eye_outline, 
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Visibility", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          ),
                          Spacer(),
                          Icon(
                            Ionicons.chevron_forward, 
                            color: Colors.black,
                          ),   
                        ],
                      ),
                    ),
                        
                    const SizedBox(
                      height: 10,
                    ),
            
                    Container(
                      width: 299,
                      height: 40,
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
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Ionicons.headset_outline, 
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Help & Support", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          ),
                          Spacer(),
                          Icon(
                            Ionicons.chevron_forward, 
                            color: Colors.black,
                          ),   
                        ],
                      ),
                    ),
            
                   const SizedBox(
                      height: 10,
                    ),
            
                    Container(
                      width: 299,
                      height: 40,
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
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Ionicons.help_circle_outline, 
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("About", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          ),
                          Spacer(),
                          Icon(
                            Ionicons.chevron_forward, 
                            color: Colors.black,
                          ),   
                        ],
                      ),
                    ),
            
                    const SizedBox(
                      height: 10,
                    ),
            
                    Container(
                      width: 299,
                      height: 40,
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
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Ionicons.shield_outline, 
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Data Privacy", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          ),
                          Spacer(),
                            Icon(
                              Ionicons.chevron_forward, 
                              color: Colors.black,
                            ),   
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}



