import 'package:flutter/material.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/data/menu_items.dart';
import 'package:list_me/model/menu_item.dart';
import 'package:list_me/screens/Settings_page.dart';
import 'package:list_me/screens/Share_page.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateList extends StatelessWidget {
  const CreateList({super.key});

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
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create List", 
          style: TextStyle(color: tc1),
          textAlign: TextAlign.justify,
        ),
        backgroundColor: tc4,
        foregroundColor: tc1,
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [tc4, tc3, tc2, tc1])),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // voice enable
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const Text("Voice enable"),
                ToggleSwitch(
                  borderColor: [tc3],
                  minWidth: 70.0,
                  minHeight: 20,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [tc1],
                    [tc3]
                  ],
                  activeFgColor: ttc1,
                  inactiveBgColor: tc4,
                  inactiveFgColor: tc1,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: ['Voice', ' enable'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),

                // menu button
                PopupMenuButton<MenuItem>(
                    icon: Icon(
                      Icons.menu_rounded,
                      color: tc1,
                      size: 36,
                    ),
                    onSelected: (item) => onSelected(context, item),
                    itemBuilder: (context) => [
                          ...MenuItems.itemsFirst.map(buildItem).toList(),
                          PopupMenuDivider(),
                          ...MenuItems.itemsSecond.map(buildItem).toList(),
                        ])
              ],
            ),
          ),

          // body


          
          // // horizontal line
          // const Padding(
          //   padding: EdgeInsets.all(25.0),
          //   child: Divider(
          //     thickness: 1,
          //     color: Color.fromRGBO(188, 253, 250, 1),
          //   ),
          // ),
          // // child: Color.fromRGBO(188, 253, 250, 1),

          // // help button
          // const Text("help"),
        ]),
      )),
    );
  }

  onSelected(BuildContext context, MenuItem item) {
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
    }
  }
}
