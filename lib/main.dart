import 'package:flutter/material.dart';
import 'package:list_me/model/button_model.dart';
import 'package:provider/provider.dart';

import 'onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ButtonModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(),

      ),
    );
  }
}
