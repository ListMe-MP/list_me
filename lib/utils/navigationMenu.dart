import 'package:flutter/material.dart';
import 'package:list_me/screens/Settings_page.dart';
import 'package:list_me/screens/Share_page.dart';
import 'package:list_me/data/menu_items.dart';
import 'package:list_me/screens/signin_page.dart';

import '../model/menu_item.dart';
import '../services/store_token.dart';
import '../services/navigation/navigation.dart';

void onSelected(BuildContext context, MenuItem item) {
  switch (item) {
    case MenuItems.itemSettings:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
      break;
    case MenuItems.itemShare:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SharePage()),
      );
    case MenuItems.itemSignOut:
      () async {
        print("sdsad00");
        await StoreToken.removeToken();
        var token = await StoreToken.getToken();
        if (token == null) {
          openSignin(context);
        }
      };
      break;
    default:
      break;
  }
}
