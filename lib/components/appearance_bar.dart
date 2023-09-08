import 'package:flutter/material.dart';

class AppearanceBar extends StatefulWidget {
  final String text;

  const AppearanceBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _AppearanceBarState createState() => _AppearanceBarState();
}

class _AppearanceBarState extends State<AppearanceBar> {
  bool isSwitchedOn = false;

  void toggleSwitch() {
    setState(() {
      isSwitchedOn = !isSwitchedOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(131, 193, 193, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(
                isSwitchedOn ? Icons.toggle_on : Icons.toggle_off,
                color: Colors.black,
              ),
              onPressed: toggleSwitch,
            )
          ],
        ),
      ),
    );
  }
}
