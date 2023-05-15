import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(8, 230, 224, 1),
                  Color.fromRGBO(2, 181, 174, 1),
                  Color.fromRGBO(20, 103, 101, 1),
                  Color.fromRGBO(29, 63, 64, 1)
                ])),
            child: PageView(
              controller: _controller,
              children: [
                // screen 1
                const Center(
                  child:
                      Text('Make Grocery Shopping A Breeze With Our List Me!'),
                ),

                // screen 2
                Container(),

                // screen3
                Container(),
              ],
            ),
          ),

          // dot indicators
          Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(controller: _controller, count: 3))
        ],
      ),
    );
  }
}
