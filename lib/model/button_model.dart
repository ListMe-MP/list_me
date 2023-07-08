import 'package:flutter/material.dart';

class ButtonModel extends ChangeNotifier {
  final List _buttonTypes = [
    // [buttonName, imagePath]
    ["Create List", "assets/images/createList.png"],
    ["Check List", "assets/images/check.png"],
    ["Settings", "assets/images/settings.png"],
    ["Review", "assets/images/review.png"]
  ];
  get buttonTypes => _buttonTypes;
}
