import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/data/menu_items.dart';

import '../model/menu_item.dart';

class TopBar extends StatelessWidget {
  final void Function(int?) onToggle;
  final Function(MenuItem) onMenuItemSelected;

  const TopBar({
    Key? key,
    required this.onToggle,
    required this.onMenuItemSelected,
  }) : super(key: key);

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            Icon(
              item.icon,
              color: Colors.black,
              size: 20,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(item.text),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ToggleSwitch(
            borderColor: [tc3],
            minWidth: 70.0,
            minHeight: 20,
            cornerRadius: 20.0,
            activeBgColors: [
              [tc1],
              [tc3],
            ],
            activeFgColor: ttc1,
            inactiveBgColor: tc4,
            inactiveFgColor: tc1,
            initialLabelIndex: 1,
            totalSwitches: 2,
            labels: ['Voice', ' enable'],
            radiusStyle: true,
            onToggle: onToggle,
          ),
          PopupMenuButton<MenuItem>(
            icon: Icon(
              Icons.menu_rounded,
              color: tc1,
              size: 36,
            ),
            onSelected: onMenuItemSelected,
            itemBuilder: (context) => [
              ...MenuItems.itemsFirst.map(buildItem).toList(),
              PopupMenuDivider(),
              ...MenuItems.itemsSecond.map(buildItem).toList(),
            ],
          ),
        ],
      ),
    );
  }

  
}
