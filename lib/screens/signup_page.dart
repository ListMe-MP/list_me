import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/top_bar.dart';
import 'package:list_me/screens/SignInSignUp_Bar.dart';
import 'package:list_me/screens/signin_page.dart';

import '../components/background.dart';
import '../components/colors.dart';
import '../utils/navigationMenu.dart';



class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            Container(
              child: SingleChildScrollView(
               child: Center(
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
                          'Sign Up',
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
                          'Sign Up',
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

                  SignInSignUpBar(hintText: "Username"),

                  SizedBox(height: 20,),

                  SignInSignUpBar(hintText: "Password"),

                  SizedBox(height: 20,),

                  SignInSignUpBar(hintText: "Email"),

               
                //username
                // Container(
                //     width: 299,
                //     height: 37,
                //     decoration: ShapeDecoration(
                //       color: Color(0x7FD4D4D4),
                //       shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //      child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: TextField(
                //       keyboardType: TextInputType.name,
                //       style: TextStyle(
                //         color: Colors.white
                //       ),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         contentPadding: EdgeInsets.only(bottom: 10, left: 12, right: 2, top: 2),
                //         hintText: 'username',
                //         hintStyle: TextStyle(
                //           color: Colors.white
                //         )
                //       ),
                      
                //     )
                //     )
                //   ),

                //   SizedBox(
                //     height: 50,
                //   ),

                //   //password field
                //   Container(
                //     width: 299,
                //     height: 37,
                //     decoration: ShapeDecoration(
                //       color: Color(0x7FD4D4D4),
                //       shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //      child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: TextField(
                //       obscureText: true,
                //       style: TextStyle(
                //         color: Colors.white
                //       ),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         contentPadding: EdgeInsets.only(bottom: 10, left: 12, right: 2, top: 2),
                //         hintText: 'password',
                //         hintStyle: TextStyle(
                //           color: Colors.white
                //         )
                //       ),
                //     )
                //     )
                //   ),

                //   SizedBox(
                //     height: 50,
                //   ),

                //   //email
                //   Container(
                //     width: 299,
                //     height: 37,
                //     decoration: ShapeDecoration(
                //       color: Color(0x7FD4D4D4),
                //       shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //      child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: TextField(
                //       obscureText: true,
                //       style: TextStyle(
                //         color: Colors.white
                //       ),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         contentPadding: EdgeInsets.only(bottom: 10, left: 12, right: 2, top: 2),
                //         hintText: 'email',
                //         hintStyle: TextStyle(
                //           color: Colors.white
                //         )
                //       ),
                //     )
                //     )
                //   ),

                  SizedBox(height: 50),


                  //sign in button
                  ElevatedButton(
                    onPressed: (){}, 
                    
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  Container(
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),


                  SizedBox(height: 10),
                  
                  //sign up text button
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400
                       ),
                    ),
                  ),
                ],
              ),
            )
              ),
            )
            
          ],
        ),
      
      )
      
    );
  }
  
  
}

               