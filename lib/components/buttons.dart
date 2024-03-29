import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_me/components/colors.dart';

// ignore: must_be_immutable
class ButtonItemTile extends StatelessWidget {
  final String btnName;
  final String imgPath;
  void Function()? onPressed;

  ButtonItemTile({
    super.key, 
    required this.btnName, 
    required this.imgPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(4, 177, 170, 1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 3, color: tc2),
            boxShadow: const [
              BoxShadow(
                color: tc2,
                offset: Offset(
                  1.0,
                  -1.0,
                ), //Offset
                blurRadius: 1.0,
                spreadRadius: 1.0,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: MaterialButton(
            onPressed: onPressed,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // image
                  Image.asset(
                    imgPath,
                    height: 100,
                  ),
                  // btn_name
                  Text(
                    btnName,
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: tc1, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
