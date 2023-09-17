import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:list_me/services/apiFeedback.dart';
import '../components/colors.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  var feedbackController = TextEditingController();

  void _showFeedbackDialog(String message, {String? title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? "Feedback Submitted"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(color: tc1),
          textAlign: TextAlign.justify,
        ),
        backgroundColor: tc4,
        foregroundColor: tc1,
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Rate your experience on using List Me",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Rating bar
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
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Leave your comments, if any, to improve us!",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: 300,
              child: TextField(
                controller: feedbackController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Comments',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                minLines: 5,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (feedbackController.text.isEmpty) {
                  _showFeedbackDialog(
                    "There is nothing to publish. Give your comments.",
                    title: "Give your Feedback",
                  );
                } else {
                  var data = {
                    "pfeedback": feedbackController.text,
                  };
                  ApiFeedback.addfeedback(data);
                  _showFeedbackDialog("Thank you for your feedback!");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent, // Change the button color here
              ),
              child: const Text(
                "Publish Feedback",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}




//atempt 2-------------------------------

// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:list_me/services/apiFeedback.dart';
// import '../components/colors.dart';

// class FeedbackPage extends StatefulWidget {
//   // const FeedbackPage({super.key});
//   FeedbackPage({Key? key}) : super(key: key);

//   @override
//   State<FeedbackPage> createState() => _FeedbackPageState();
// }

// class _FeedbackPageState extends State<FeedbackPage> {
//   var feedbackController = TextEditingController();

//   void _showFeedbackDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Feedback Submitted"),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//    // String feedbackMessage = "Give your feedback!";

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Notifications",
//           style: TextStyle(color: tc1),
//           textAlign: TextAlign.justify,
//         ),
//         backgroundColor: tc4,
//         foregroundColor: tc1,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Center(
//                 child: Text(
//                   "Give your feedback!",
//                   //feedbackMessage,
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: const Text(
//                 "Rate your experience on using List Me",
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             // Rating bar
//             RatingBar.builder(
//               initialRating: 3,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//               itemBuilder: (context, _) => const Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 print(rating);
//               },
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             const Text(
//               "Leave your comments, if any, to improve us!",
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 20),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               height: 200,
//               width: 300,
//               child: TextField(
//                 controller: feedbackController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Comments',
//                 ),
//                 style: TextStyle(fontSize: 16), // Adjust the font size as needed
//                 maxLines: null, // Allow multiple lines
//                 keyboardType:
//                     TextInputType.multiline, // Enable multiline input
//                 minLines: 5, // Set the minimum lines to display
//                 textAlignVertical:
//                     TextAlignVertical.center, // Center text vertically
//                 textAlign: TextAlign.left, // Align text to the left
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (feedbackController.text.isEmpty) {
//                   _showFeedbackDialog("There is nothing to publish. Give your comments.");
//                 } else {
//                   var data = {
//                     "pfeedback": feedbackController.text,
//                   };
//                   ApiFeedback.addfeedback(data);
//                   _showFeedbackDialog("Thank you for your feedback!");
//                 }
//               },
//               child: const Text(
//                 "Publish Feedback",
//                 style: TextStyle(color: Colors.black),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//attempt 1-----------------------------------------

// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:list_me/services/apiFeedback.dart';
// import '../components/colors.dart';

// class FeedbackPage extends StatefulWidget {
//   const FeedbackPage({super.key});

//   @override
//   State<FeedbackPage> createState() => _FeedbackPageState();
// }

// class _FeedbackPageState extends State<FeedbackPage> {
//   var feedbackController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//           title: const Text(
//             "Notifications",
//             style: TextStyle(color: tc1),
//             textAlign: TextAlign.justify,
//           ),
//           backgroundColor: tc4,
//           foregroundColor: tc1,
//         ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Center(
//                 child: Text(
//                   "Give your feedback!",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//               ),
//             ),
      
//             const SizedBox(height: 50,),
            
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: const Text(
//                 textAlign: TextAlign.left,
//                 "Rate your experience on using List Me",
//                 style: TextStyle(fontSize: 20),
//                 ),
//             ),
      
//             const SizedBox(height: 10,),
      
//             //Rating bar
//             RatingBar.builder(
//               initialRating: 3,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//               itemBuilder: (context, _) => const Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 print(rating);
//               },
//             ),
      
//             const SizedBox(height: 40,),
      
//             const Text(
//               "Leave your comments, if any, to improve us!",
//               textAlign: TextAlign.left,
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
//             ),

//             const SizedBox(height: 10,),

//             SizedBox(
//               height: 200,
//               width: 300,
//               child: TextField(
//                 controller: feedbackController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Comments',
//                 ),
//                 style: TextStyle(fontSize: 16), // Adjust the font size as needed
//                 maxLines: null, // Allow multiple lines
//                 keyboardType: TextInputType.multiline, // Enable multiline input
//                 minLines: 5, // Set the minimum lines to display
//                 textAlignVertical: TextAlignVertical.center, // Center text vertically
//                 textAlign: TextAlign.left, // Align text to the left
//               ),
//             ),


//             //publish button
//             ElevatedButton(
//               onPressed: () {
//                 var data = {
//                   "pfeedback": feedbackController.text,
//                 };

//                 ApiFeedback.addfeedback(data);
//                  // Send POST request to "/api/add_feedback"
//               },
//               child: const Text(
//                 "Publish Feedback",
//                 style: TextStyle(color: Colors.black),
//               ),
//             )

//           ],
//         ),
//       ),
//     );
//   }
// }

