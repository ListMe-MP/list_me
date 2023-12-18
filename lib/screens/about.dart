import 'package:flutter/material.dart';
import 'package:list_me/components/colors.dart';

class About extends StatelessWidget {
  const About({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About",
          style: TextStyle(color: tc1),
          textAlign: TextAlign.justify,
        ),
        backgroundColor: tc4,
        foregroundColor: tc1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your sentences here using Text widgets
            Text(
              'About ListMe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Welcome to ListMe, your smart companion in grocery shopping! In a world dominated by technology and digitalization, ListMe emerges as a solution to streamline and enhance your shopping experience. Especially tailored for users in Sri Lanka and beyond, ListMe addresses common challenges faced during manual grocery shopping.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            // Add more Text widgets for other sentences...

            // Add a divider between sections
            const Divider(),

            // Add more Text widgets for other sections...

            // Example:
            Text(
              'Unique Features',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '1. *Voice Input and Output:* Unlike other apps, ListMe allows users not only to input items via voice but also to hear the list when needed. This feature is especially beneficial for visually impaired users.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '2. *Import Lists from Websites:* Instead of manually typing each item, ListMe enables users to import item lists effortlessly from websites or blogs, making recipe creation a breeze.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Add more Text widgets for other features...

            // Add a divider between sections
            const Divider(),

            // Add more Text widgets for other sections...

            // Example:
            Text(
              'Eco-Friendly and Inclusive',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'ListMe aims to be an eco-friendly application, reducing paper wastage and providing an inclusive experience for the visually impaired.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Add more Text widgets for other points...

            // Add a divider between sections
            const Divider(),

            // Add more Text widgets for other sections...

            // Example:
            Text(
              'Objectives',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '1. *Voice Input Facility:* Enable users to add items to the list via voice input.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '2. *Environmental Impact:* Reduce wastage of paper and contribute to environmental conservation.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Add more Text widgets for other objectives...

            // Add a divider between sections
            const Divider(),

            // Add more Text widgets for other sections...

            // Example:
            Text(
              'Feasibility Analysis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Add more Text widgets for operational, technical, financial, and schedule feasibility...

            // Add a divider between sections
            const Divider(),

            // Add more Text widgets for other sections...

            // Example:
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'For information regarding the privacy policy, please refer to our dedicated [Privacy Policy page](#) for detailed insights into how ListMe handles your data and ensures a secure user experience.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Add more Text widgets for other sections...

            // Add a divider between sections
            const Divider(),

            // Add more Text widgets for other sections...

            // Closing message
            Text(
              'Join us on this exciting journey of smarter and more efficient grocery shopping with ListMe!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
