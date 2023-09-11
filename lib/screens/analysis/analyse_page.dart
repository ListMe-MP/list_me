import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/screens/analysis/chart.dart';


import '../../components/top_bar.dart';
import '../../utils/navigationMenu.dart';

class Analyse extends StatefulWidget {
  const Analyse({super.key});

  @override
  State<Analyse> createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> with TickerProviderStateMixin {

  List day = ['Day', 'Week', 'Month', 'Year'];
  int index_color = 0;
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Analysis",
              style: TextStyle(color: tc1),
              textAlign: TextAlign.justify,
            ),
            backgroundColor: tc4,
            foregroundColor: tc1,
          ),
          body: Stack(children: [
            const Background(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopBar(
                    onToggle: (index) {
                      print('switched to:$index');
                    },
                    onMenuItemSelected: (item) => onSelected(context, item),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Stack(
                      children: [
                        Text(
                          'Analysis',
                          style: GoogleFonts.castoro(
                              fontSize: 40.0,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 5
                                ..color = tc5),
                        ),
                        Text('Analysis',
                            style: GoogleFonts.castoro(
                              fontSize: 40.0,
                              color: tc6,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
      
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          4,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  index_color = index;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: index_color == index 
                                    ? const Color.fromARGB(255, 47, 125, 121) 
                                    : Colors.white
                                    ),
                                alignment: Alignment.center,
                                child: Text(
                                  day[index],
                                  style: TextStyle(
                                      color: index_color == index 
                                    ? Colors.white 
                                    : Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),                  
                 
                  const SizedBox(
                    height: 15,
                  ),
                  const Chart(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
