// import 'package:flutter/material.dart';
// import 'package:list_me/model/button_model.dart';
// import 'package:provider/provider.dart';

// import 'model/ThemeModel.dart';
// import 'onboarding_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ButtonModel(),
//       create: (_) => ThemeModel(),
      
//       child: Consumer(builder: (context, ThemeModel themeModel, child){
//          return MaterialApp(
//          debugShowCheckedModeBanner: false,
//          theme: themeModel.isdark ? ThemeData.dark() : ThemeData.light(),
//          home: OnBoardingScreen(),

//        );
//       }
     
//     ));
//   }
// }


import 'package:flutter/material.dart';
import 'package:list_me/model/button_model.dart';
import 'package:list_me/screens/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'model/ThemeModel.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ButtonModel()),
        ChangeNotifierProvider(create: (context) => ThemeModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeModel.isdark ? ThemeData.dark() : ThemeData.light(),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
