import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';

import '../model/ThemeModel.dart';

// 

class AppearanceBar extends StatefulWidget {
  final String text;
  final bool showToggleSwitch; // New property

  const AppearanceBar({
    Key? key,
    required this.text,
    this.showToggleSwitch = false, // Default to false if not specified
  }) : super(key: key);

  @override
  _AppearanceBarState createState() => _AppearanceBarState();
}

class _AppearanceBarState extends State<AppearanceBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        height: 70,
        width: 500,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              if (widget.showToggleSwitch) // Conditionally display the SwitcherButton
                SwitcherButton(
                  value: themeNotifier.isdark ? false : true,
                  onChange: (value) {
                    themeNotifier.isdark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  },
                ),
            ],
          ),
        ),
      );
    });
  }
}
