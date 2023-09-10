import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Give your feedback!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                textAlign: TextAlign.left,
                "Rate your experience on using List Me",
                style: TextStyle(fontSize: 20),
                ),
            ),
          ),

          Container(
            child: Row(
              children: [
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

