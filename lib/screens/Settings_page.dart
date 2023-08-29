import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/maintitle.dart';
import 'package:list_me/components/settings_bar.dart';

import '../components/top_bar.dart';

import '../model/menu_item.dart';
import '../utils/navigationMenu.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  
  Function(MenuItem e)? get buildItem => null;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(color: tc1),
            textAlign: TextAlign.justify,
          ),
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
      body: SafeArea(
        child: Stack(
          children: [
      
            const Background(),
      
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Top Bar
                     TopBar(
                          onToggle: (index){
                            print('switched to:$index');
                          }, 
                          onMenuItemSelected: (item ) => onSelected(context, item),
                        ),
                    
                        

                    const SizedBox(
                      height: 10,
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


            MainTitle(),

            // Padding(
            //   padding: EdgeInsets.only(top: 60.0),
            //     child: Stack(
            //       children: <Widget>[
            //     // Stroked text as border.
            //         Text(
            //           'List Me',
            //               style: GoogleFonts.castoro(
            //                 fontSize: 40,
            //                 shadows: [
            //                   Shadow(
            //                     blurRadius: 10.0,
            //                     color: Colors.black,
            //                     offset: Offset(2, -2))
            //                   ],
            //                 foreground: Paint()
            //                   ..style = PaintingStyle.stroke
            //                   ..strokeWidth = 5
            //                   ..color = tc5,
            //               ),
            //         ),
            //     // Solid text as fill.
            //         Text(
            //           'List Me',
            //           style: GoogleFonts.castoro(
            //           fontSize: 40,
            //           color: tc6,
            //         ),
            //         ),
            //       ],
            //     ),
            // ),



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



