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
       appBar: AppBar(
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
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
                    padding: const EdgeInsets.only(top: 0.0),

                    child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Sign Up',
                          style: GoogleFonts.castoro(
                            fontSize: 40,
                            shadows: [
                              const Shadow(
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

                  const SizedBox(
                    height: 50,
                  ),

                  const SignInSignUpBar(hintText: "Username"),

                  const SizedBox(height: 20,),

                  const SignInSignUpBar(hintText: "Password"),

                  const SizedBox(height: 20,),

                  const SignInSignUpBar(hintText: "Email"),

               
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

                  const SizedBox(height: 50),


                  //sign in button
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ), 
                    
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  Container(
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),


                  const SizedBox(height: 10),
                  
                  //sign up text button
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const SignInPage()),
                        );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600
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

               