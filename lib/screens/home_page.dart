import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/top_bar.dart';
import 'package:list_me/model/button_model.dart';
import 'package:list_me/screens/help_&_support.dart';
import 'package:provider/provider.dart';

import '../components/buttons.dart';
import '../utils/navigationMenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // backkground style
            const Background(),

            // components
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'List Me',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
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
                            'List Me',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              color: tc6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // grid
                    Container(
                      child: Expanded(child: Consumer<ButtonModel>(
                        builder: (context, value, child) {
                          return GridView.builder(
                              itemCount: value.buttonTypes.length,
                              padding: const EdgeInsets.all(36.0),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return ButtonItemTile(
                                    btnName: value.buttonTypes[index][0],
                                    imgPath: value.buttonTypes[index][1],
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  value.buttonTypes[index][2]));
                                    });
                              });
                        },
                      )),
                    ),
                    // horizontal line
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        thickness: 1,
                        color: Color.fromRGBO(188, 253, 250, 1),
                      ),
                    ),
                    // child: Color.fromRGBO(188, 253, 250, 1),

                    // help button
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HelpPage(),
                          ));
                        },
                        child: Text("help")),

                    // TextButton(
                    //   onPressed: (){
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => HelpPage(),
                    //         )
                    //     );
                    //   },
                    //   child: Text("help")
                    // )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
