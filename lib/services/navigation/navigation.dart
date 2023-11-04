import 'package:flutter/material.dart';
import 'package:list_me/screens/home_page.dart';
import 'package:list_me/screens/onboarding_screen.dart';
import 'package:list_me/screens/signin_page.dart';

void openSignin(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SignInPage()));
}


void openHome(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomePage()));
}
void openOnboard(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) =>OnBoardingScreen() ));
}