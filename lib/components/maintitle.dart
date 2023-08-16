import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

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
    );
  }
}
