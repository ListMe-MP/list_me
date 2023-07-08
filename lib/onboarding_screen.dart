import 'package:flutter/material.dart';
import 'package:list_me/components/background.dart';
import 'package:list_me/components/colors.dart';
import 'package:list_me/components/fontstyle.dart';
import 'package:list_me/screens/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  final PageController _controller = PageController();

  // keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background
          const Background(),
          // logo image
          Container(
            alignment: const Alignment(0, -0.65),
            child: SizedBox(
              width: 180,
              height: 180,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),

          // paragraph
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              // screen 1
              Center(
                child: Container(
                  alignment: const Alignment(0, 0.25),
                  child: Text(
                      '"Make\nGrocery Shopping\nA Breeze\nWith\nOur\nList Me!"',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.castoro(
                        textStyle: fstyle1,
                      )),
                ),
              ),

              // screen 2
              Center(
                child: Container(
                  alignment: const Alignment(0, 0.3),
                  child: Text('"List\nWith Your Voice,\nNot\nWith Your Hands!"',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.castoro(
                        textStyle: fstyle1,
                      )),
                ),
              ),

              // screen3
              Center(
                child: Container(
                  alignment: const Alignment(0, 0.3),
                  child: Text(
                      '"Experience\nGrocery Shopping\nLike Never\nBefore!"',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.castoro(
                        textStyle: fstyle1,
                      )),
                ),
              ),
            ],
          ),

          // dot indicators
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      'skip',
                      style: TextStyle(color: ttc1, fontSize: 24),
                    ),
                  ),
                  // dot indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ScrollingDotsEffect(
                      activeDotColor: ttc1,
                      dotColor: Color.fromRGBO(29, 63, 64, 1),
                    ),
                  ),
                  // next or done
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          },
                          child: const Text(
                            'done',
                            style: TextStyle(color: ttc1, fontSize: 24),
                          ))
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            'next',
                            style: TextStyle(color: ttc1, fontSize: 24),
                          )),
                ],
              )),
        ],
      ),
    );
  }

  GoogleFonts googlefonts() => GoogleFonts();
}
