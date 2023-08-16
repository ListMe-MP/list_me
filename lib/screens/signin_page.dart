import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/top_bar.dart';

import '../components/background.dart';
import '../components/colors.dart';
import '../utils/navigationMenu.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            Center(
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
                      height: 50,
                    ),

                  //Sign In title
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),

                    child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Sign In',
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
                          'Sign In',
                          style: GoogleFonts.castoro(
                            fontSize: 40,
                            color: tc6,
                        ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  //username field
                  Container(
                    width: 299,
                    height: 37,
                    decoration: ShapeDecoration(
                      color: Color(0x7FD4D4D4),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'username',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )

                    // child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     "username",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  //password field
                  Container(
                    width: 299,
                    height: 37,
                    decoration: ShapeDecoration(
                      color: Color(0x7FD4D4D4),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                     child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}