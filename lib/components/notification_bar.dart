import 'package:flutter/material.dart';

class NotificationBar extends StatefulWidget {
  final String text;
  final bool showToggleSwitch;

  const NotificationBar({
    Key? key,
    required this.text,
    this.showToggleSwitch = true, //Default to true if not specified
  }) : super(key: key);

  @override
  _NotificationBarState createState() => _NotificationBarState();
}

class _NotificationBarState extends State<NotificationBar> {
  bool isSwitchedOn = false;

  void toggleSwitch() {
    setState(() {
      isSwitchedOn = !isSwitchedOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 500,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        border: Border.all(color: Colors.black)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            if(widget.showToggleSwitch)
              IconButton(
               icon: Icon(
               isSwitchedOn ? Icons.toggle_on : Icons.toggle_off,
               color: Colors.black,
               ),
               onPressed: toggleSwitch,
               iconSize: 40,
             )
             //conditionally show the toggle 
          ],
        ),
      ),
    );
  }
}
