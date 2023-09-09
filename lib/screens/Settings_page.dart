import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/maintitle.dart';
import 'package:list_me/components/settings_bar.dart';
import 'package:list_me/screens/notifications.dart';

import '../components/top_bar.dart';

import '../model/menu_item.dart';
import '../utils/navigationMenu.dart';
import 'Share_page.dart';
import 'appearance.dart';
import 'categories.dart';


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
                    
                        

                    SizedBox(height: 10,),



                    MainTitle(),

        
                    SizedBox(height: 50,),
      

                    SettingsBar(
                      icon: Ionicons.person_outline, 
                      title: "Appearance",
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AppearancePage()
                          )
                        );
                      },
                    ),

                    SizedBox(height: 15,),

                    SettingsBar(
                      icon: Ionicons.notifications_outline, 
                      title: "Notification",
                      onTap: (){
                        print('Tapped on title'); 
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage()
                          )
                        );
                      },
                    ),

                    SizedBox(height: 15,),

                    SettingsBar(
                      icon: Ionicons.share_social_outline, 
                      title: "Share List",
                      onTap: (){
                        showDialog(
                          context: context, 
                          builder: (ctx) => AlertDialog(
                            title: Text("List Me Account Needed"),
                            content: Text(
                              "To share your lists, you need an account. You can create new account or sign in an existing account"
                            ),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.of(ctx).pop();
                                }, 
                                child: Container(
                                  padding: EdgeInsets.all(14),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.teal[900]),
                                      ),
                                      ),
                                       Container(
                                        child: Text(
                                        "Okay",
                                        style: TextStyle(color: Colors.teal[900]),
                                      ),
                                      )
                                    ],
                                  ),
                                  
                                  // child: Text(
                                  //   "Okay",
                                  //   style: TextStyle(color: Colors.teal[900]
                                  //   ),
                                  // ),
                                )
                              )
                            ],
                          )
                        );
                         
                        
                      },
                    ),

                      SizedBox(height: 15),

                    SettingsBar(
                      icon: Ionicons.person_outline, 
                      title: "Categories",
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CategoriesPage()
                          )
                        );
                      },
                    ),

                    SizedBox(height: 15,),

                    SettingsBar(
                      icon: Ionicons.shield_outline, 
                      title: "Data Privacy",
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NotificationPage()
                          )
                        );
                      },
                    ),

                     SizedBox(height: 15,),

                    SettingsBar(
                      icon: Ionicons.headset_outline, 
                      title: "Help & Support",
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NotificationPage()
                          )
                        );
                      },
                    ),

                    SizedBox(height: 15,),


                    SettingsBar(
                      icon: Ionicons.help_circle_outline, 
                      title: "About",
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NotificationPage()
                          )
                        );
                      },
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



