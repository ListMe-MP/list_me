import 'package:flutter/material.dart';

class SignInSignUpBar extends StatelessWidget {
  final String hintText;

  const SignInSignUpBar({
    super.key, 
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 299,
      height: 37,
      decoration: ShapeDecoration(
        color: Color(0x7FD4D4D4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Colors.white
          ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 10, left: 12, right: 2, top: 2),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white
          )
        ),
                      
        )
      ),
    );
    
  }
}
