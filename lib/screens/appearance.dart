import 'package:flutter/material.dart';


import '../components/appearance_bar.dart';
import '../components/colors.dart';



class AppearancePage extends StatelessWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Appearance",
            style: TextStyle(color: tc1),
            textAlign: TextAlign.justify,
          ),
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
      body: Column(
        children: [
         
          AppearanceBar(text: "Theme"),
          AppearanceBar(text: "Font"),
          AppearanceBar(text: "Font Size"),
          AppearanceBar(text: "Font Style"),
          AppearanceBar(text: "Theme"),
          AppearanceBar(text: "Theme"),
         
        ],
      ),
    );
  }
}