import 'package:flutter/material.dart';
import 'package:list_me/model/menu_item.dart';

class MenuItems {
  static const List<MenuItem> itemsFirst = [
    itemSettings,
    itemShare,
  ];

  static const List<MenuItem> itemsSecond = [
    itemSignOut,
  ];

  static const itemSettings = MenuItem(
    text: "Settings",
    icon: Icons.settings,
  );

  static const itemShare = MenuItem(
    text: "Share",
    icon: Icons.share,
  );

  static const itemSignOut = MenuItem(text: 'Sign Out', icon: Icons.login);
}
