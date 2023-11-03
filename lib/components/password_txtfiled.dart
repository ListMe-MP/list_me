import 'package:flutter/material.dart';

class PasswordtxtField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const PasswordtxtField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordtxtFieldState createState() => _PasswordtxtFieldState();
}

class _PasswordtxtFieldState extends State<PasswordtxtField> {
  bool _isObscure = true;

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
          controller: widget.controller,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: Colors.black),
          obscureText: _isObscure, // This hides/shows the password
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _isObscure ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(
              bottom: 10,
              left: 12,
              right: 2,
              top: 2,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
