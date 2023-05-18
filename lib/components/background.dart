import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
              Color.fromRGBO(8, 230, 224, 1),
              Color.fromRGBO(2, 181, 174, 1),
              Color.fromRGBO(20, 103, 101, 1),
              Color.fromRGBO(29, 63, 64, 1)
            ]))),
      ),
    );
  }
}
