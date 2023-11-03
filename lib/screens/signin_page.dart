import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/flutter_toast.dart';
import 'package:list_me/components/password_txtfiled.dart';
import 'package:list_me/components/top_bar.dart';
import 'package:list_me/screens/SignInSignUp_Bar.dart';
import 'package:list_me/screens/signup_page.dart';
import 'package:list_me/services/api/user/userapi.dart';
import 'package:list_me/services/navigation/navigation.dart';
import 'package:list_me/services/validate_handeler.dart';
import 'package:list_me/utils/const.dart';
import '../components/background.dart';
import '../components/colors.dart';
import '../utils/navigationMenu.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
        body: Form(
          key: _form,
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
                                'Sign In',
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
                                'Sign In',
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
                            await signin(email.text, password.text, context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),

                        const SizedBox(height: 50),

                        Container(
                          child: const Text(
                            "New to List Me?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        //Sign up text button
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
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

  signin(String email, String password, BuildContext context) async {
    if (_form.currentState!.validate()) {
      final int res = await UserApi.loginUser(
        email,
        password,
      );
      if (res == resOk) {
  
        openHome(context);
        ToastWidget.toast(msg: "Login successfully");
      } else {
        ToastWidget.toast(msg: "Email or Password is wrong.");
      }
    }
  }
}
