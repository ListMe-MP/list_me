import 'package:flutter/material.dart';
import 'package:list_me/screens/Settings_page.dart';
import 'package:list_me/screens/Share_page.dart';
import 'package:list_me/data/menu_items.dart';

import '../model/menu_item.dart';

void onSelected(BuildContext context, MenuItem item) {
  switch (item) {
    case MenuItems.itemSettings:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
      break;
    case MenuItems.itemShare:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SharePage()),
      );
      break;
    default:
      break;
  }
}