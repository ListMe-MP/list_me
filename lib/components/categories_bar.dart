import 'package:flutter/material.dart';

class CategoriesBar extends StatefulWidget {
  final String text;

  const CategoriesBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _CategoriesBarState createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  get onPressed => null;

 
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
            
          ],
        ),
      ),
    );
  }
}
