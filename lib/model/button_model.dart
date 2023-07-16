import 'package:flutter/material.dart';
import 'package:list_me/screens/Settings_page.dart';
import 'package:list_me/screens/check_list.dart';
import 'package:list_me/screens/create_list.dart';
import 'package:list_me/screens/review_page.dart';

class ButtonModel extends ChangeNotifier {
  final List _buttonTypes = [
    // [buttonName, imagePath]
    ["Create List", "assets/images/createList.png", const CreateList()],
    ["Check List", "assets/images/check.png", const CheckList()],
    ["Settings", "assets/images/settings.png", const SettingsPage()],
    ["Review", "assets/images/review.png", const Review()]
  ];
  get buttonTypes => _buttonTypes;

  // void buttonNavigate(int index){
  //   return _buttonTypes[index[]]
  // }
}
