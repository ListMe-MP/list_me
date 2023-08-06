import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/settings_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:list_me/data/menu_items.dart';
import 'package:list_me/model/menu_item.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/navigationMenu.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  
  Function(MenuItem e)? get buildItem => null;

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
                        
                        const Spacer(),
                        //Menubar
                        PopupMenuButton<MenuItem>(
                          icon: Icon(
                            Icons.menu_rounded,
                            color: tc1,
                            size: 36,
                          ),
                          onSelected: (item) => onSelected(context, item),
                          itemBuilder: (context) => [
                            ...MenuItems.itemsFirst.map(buildItem!).toList(),
                          PopupMenuDivider(),
                          ...MenuItems.itemsSecond.map(buildItem!).toList(),
                        ])
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
      

                    SettingsBar(
                      icon: Ionicons.person_outline, 
                      title: "Profile"
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    SettingsBar(
                      icon: Ionicons.notifications_outline, 
                      title: "Notification"
                    ),

                     SizedBox(
                      height: 15,
                    ),

                    SettingsBar(
                      icon: Ionicons.shield_outline, 
                      title: "Data Privacy"
                    ),

                     SizedBox(
                      height: 15,
                    ),

                    SettingsBar(
                      icon: Ionicons.headset_outline, 
                      title: "Help & Support"
                    ),

                     SizedBox(
                      height: 15,
                    ),

                    SettingsBar(
                      icon: Ionicons.help_circle_outline, 
                      title: "About"
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



