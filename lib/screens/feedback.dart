import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Give your feedback!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
              ),
            ),
      
            const SizedBox(height: 50,),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(
                  textAlign: TextAlign.left,
                  "Rate your experience on using List Me",
                  style: TextStyle(fontSize: 20),
                  ),
              ),
            ),
      
            const SizedBox(height: 10,),
      
            //Rating bar
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
      
            const SizedBox(height: 40,),
      
            Container(
              child: const Text(
                "Leave your comments, if any, to improve us!",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),

            const SizedBox(height: 10,),

            // SizedBox(
            //   height: 100,
            //   width: 300,
            //   child: const TextField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       hintText: 'Comments',
            //     ),
            //   ),
            // ),


            const SizedBox(
              height: 200,
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Comments',
                ),
                style: TextStyle(fontSize: 16), // Adjust the font size as needed
                maxLines: null, // Allow multiple lines
                keyboardType: TextInputType.multiline, // Enable multiline input
                minLines: 5, // Set the minimum lines to display
                textAlignVertical: TextAlignVertical.center, // Center text vertically
                textAlign: TextAlign.left, // Align text to the left
              ),
            ),


            //publish button
            ElevatedButton(
              onPressed: (){}, 
              child: const Text(
                "Publsih Feedback",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

