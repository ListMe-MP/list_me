import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/data/menu_items.dart';
import 'package:list_me/model/menu_item.dart';
import 'package:list_me/screens/Settings_page.dart';
import 'package:list_me/screens/Share_page.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateList extends StatefulWidget {
  const CreateList({super.key});

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
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

          // title
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'List Me',
                  style: GoogleFonts.castoro(
                    fontSize: 40,
                    shadows: [
                      Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2, -2))
                    ],
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = tc5,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'List Me',
                  style: GoogleFonts.castoro(
                    fontSize: 40,
                    color: tc6,
                  ),
                ),
              ],
            ),
          ),

          // textfield for title of the list
          Container(
            width: 350,
            height: 40,
            decoration: ShapeDecoration(
              color: Color(0x7FD4D4D4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Untitled list-1",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          // text field for type the list items
          Container(
            width: 350,
            height: 40,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type Here",
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                    fontFamily: 'Castoro',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
          ),

          // item list
          Container(
            width: 350,
            height: 390,
            decoration: ShapeDecoration(
              color: Color(0x7FD4D4D4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        color: Colors.white.withOpacity(0.1),
                        child: ListTile(
                          // contentPadding: EdgeInsets.all(8.0),
                          title: Text(
                            'Item $index',
                          ),
                          subtitle: Text(
                            '\$ 20',
                          ),
                          trailing: Icon(Icons.edit),
                          onTap: () {
                            // Add your onTap logic here
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                        height:
                            10); // Adjust the height as per your padding needs
                  },
                  itemCount: 10,
                  scrollDirection: Axis
                      .vertical, // Replace this with the number of ListTiles you want
                ),
              ],
            ),
          ),

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
