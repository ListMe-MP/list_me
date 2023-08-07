import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import '../components/top_bar.dart';
import '../utils/navigationMenu.dart';

class CreateList extends StatefulWidget {
  const CreateList({super.key});

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
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
        body: Stack(
          children: [
            Background(),
            Container(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // TopBar
                      TopBar(
                        onToggle: (index) {
                          print('switched to:$index');
                        },
                        onMenuItemSelected: (item) => onSelected(context, item),
                      ),

                      // title
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
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
                        height: 5,
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
                          child: Row(
                            children: [
                              const Expanded(
                                child: Padding(
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

                              // add button
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_box_outlined,
                                  color: tc1,
                                ),
                              )
                            ],
                          )),

                      const SizedBox(
                        height: 5,
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
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                color: Colors.white.withOpacity(0.1),
                                child: ListTile(
                                  // contentPadding: EdgeInsets.all(8.0),
                                  leading: Image.asset(
                                    'assets/images/items/item0.png',
                                    // width: 40,
                                    // height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    'Item $index',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: tc1),
                                  ),
                                  subtitle: Text(
                                    '\$ 20',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: tc2),
                                  ),

                                  trailing: Icon(
                                    Icons.edit,
                                    color: tc1,
                                  ),
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
                      ),
                    ]),
              ),
            ),

            // Create button
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(2, 2)
                    )
                  ],
                  shape: BoxShape.circle,
                ),
                child: RawMaterialButton(
                  onPressed: () {
                    // submit 
                  },
                  shape: CircleBorder(
                    side: BorderSide(
                      color: tc3,
                      width: 5.0
                    )
                  ),   
                  padding: EdgeInsets.all(10.0),
                  fillColor: tc1,
                  splashColor: tc2,
                  child: Icon(
                    Icons.add,
                    color: tc5,
                    size: 40.0,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
