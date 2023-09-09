import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingsBar extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;


   const SettingsBar({
    super.key, 
    required this.icon, 
    required this.title,
    required this.onTap,
  });
  
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                          
                          
                          child:  Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                 icon, 
                                  ),
                              ),
                              
                             
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                   title,
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                    ),
                                ),
                                Spacer(),
                              
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Ionicons.chevron_forward, 
                                    color: Colors.black,
                                    
                                  ),
                                ),   
                            ],
                          ),
                        
      ),
    );
  }
}