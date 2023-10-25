import 'package:flutter/material.dart';

class SignInSignUpBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const SignInSignUpBar({
    super.key,
    required this.hintText, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 299,
      height: 37,
      decoration: ShapeDecoration(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            
            keyboardType: TextInputType.name,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                    bottom: 10, left: 12, right: 2, top: 2),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.black)),
          )),
    );
  }
}
