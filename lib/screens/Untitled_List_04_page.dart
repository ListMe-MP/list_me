import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/screens/create_list.dart';

// import '../components/background.dart';
import '../components/colors.dart';
import '../components/top_bar.dart';
import '../utils/navigationMenu.dart';

class CheckList04 extends StatefulWidget {
  Map<String, dynamic> data;
  CheckList04({super.key, required this.data});

//    final List<Map<String, dynamic>> foodItem = [
//     ...data,

//     // ... Add more items here
// ];

  // List<String>foodItems = [
  //   'Suger 1kg',
  //   'Fresh milk',
  //   'White Chocolate',
  //   'Vanila',
  //   'Ice Cream',
  //   'Baking Soda',
  // ];

  @override
  State<CheckList04> createState() => _CheckList04State();
}

class _CheckList04State extends State<CheckList04> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // const Background(),
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TopBar(
                  onToggle: (index) {
                    print('switched to:$index');
                  },
                  onMenuItemSelected: (item) => onSelected(context, item),
                ),
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      widget.data['lTitle'],
                      style: GoogleFonts.castoro(
                        fontSize: 25,
                        shadows: [
                          const Shadow(
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
                      widget.data['lTitle']!,
                      style: GoogleFonts.castoro(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: double.infinity,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const CreateList();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.mode_edit_outline_sharp),
                    color: Colors.black,
                    alignment: Alignment.topRight,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.data['items'].length,
                    itemBuilder: (context, index) {
                      print(widget.data['items'][index]);

                      return Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(131, 193, 193, 1),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ]),
                        //     child: ListTile(
                        // title: Text(widget.items[index]['items']),
                        //
                        child: ListTile(
                          title: Text(
                              widget.data['items'][index]['pname'].toString()),
                          trailing: Checkbox(
                            value: widget.data['items'][index]['ischecked'] ==
                                true,
                            activeColor: const Color.fromRGBO(131, 193, 193, 1),
                            checkColor: const Color.fromARGB(255, 1, 1, 1),
                            tristate: true, // Fix typo here
                            onChanged: (newBool) {
                              setState(() {
                                if (newBool == null || newBool) {
                                  widget.data['items'][index]['ischecked'] =
                                      newBool;
                                }
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
