
import 'package:flutter/material.dart';

class ItemCrad extends StatelessWidget {
 final  String item_name;
  final String quantity;
  final String amount;

  const ItemCrad({super.key,required this.item_name,required this.quantity,required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 35,
              width: 190,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: const Color(0x7FD4D4D4)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item_name,
                  style: const TextStyle(fontSize: 15),
                  
                ),
              ),
            ),
            const SizedBox(width: 10),

            Container(
              height: 35,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: const Color(0x7FD4D4D4)),
              child: Text(quantity),
            ),
            const SizedBox(width: 10),

            Container(
              height: 35,
              width: 90,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: const Color(0x7FD4D4D4)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(amount),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

