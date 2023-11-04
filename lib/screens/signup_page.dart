import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/password_txtfiled.dart';
import 'package:list_me/components/top_bar.dart';
import 'package:list_me/model/user.dart';
import 'package:list_me/screens/SignInSignUp_Bar.dart';
import 'package:list_me/screens/signin_page.dart';
import 'package:list_me/services/api/user/userapi.dart';
import 'package:list_me/services/navigation/navigation.dart';
import 'package:list_me/services/validate_handeler.dart';

import '../components/background.dart';
import '../components/colors.dart';
import '../utils/navigationMenu.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
        body: Form(
          key: formKey,
          child: SafeArea(
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
                          onToggle: (index) {
                            print('switched to:$index');
                          },
                          onMenuItemSelected: (item) =>
                              onSelected(context, item),
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

                        SignInSignUpBar(
                          validator: (value) {
                            return Validater.genaralvalid(value!);
                          },
                          hintText: "Username",
                          controller: name,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        SignInSignUpBar(
                          validator: (value) {
                            return Validater.validEmail(value!);
                          },
                          hintText: "Email",
                          controller: email,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        PasswordtxtField(
                          hintText: "Password",
                          controller: password,
                        ),

                        const SizedBox(height: 50),

                        //sign in button
                        ElevatedButton(
                          onPressed: () async {
                            User user = User(
                                username: name.text,
                                email: email.text,
                                password: password.text);
                            await signup(user, context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.black),
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ));
  }

  signup(User user, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      int res = await UserApi.registerUser(user);
      if (res == 1) {
        openSignin(context);
      } else {
        email.clear();
        name.clear();
        password.clear();
        print("no");
      }
    }
  }
}
