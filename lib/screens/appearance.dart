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
          AppearanceBar(text: "Dark Theme"),
          AppearanceBar(text: "Font", showToggleSwitch: false),
          AppearanceBar(text: "Font Size", showToggleSwitch: false),
          AppearanceBar(text: "Font Style", showToggleSwitch: false),

        ],
      ),
    );
  }
}