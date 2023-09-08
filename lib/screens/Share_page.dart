import 'package:flutter/material.dart';
import 'package:list_me/components/colors.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share List"),
        backgroundColor: tc4,
      ),
    );
  }
}