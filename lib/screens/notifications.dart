import 'package:flutter/material.dart';
import 'package:list_me/components/notification_bar.dart';

import '../components/colors.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Notifications",
            style: TextStyle(color: tc1),
            textAlign: TextAlign.justify,
          ),
          backgroundColor: tc4,
          foregroundColor: tc1,
        ),
      body: Column(
        children: [
          //push notifications
          NotificationBar(text: "PUSH NOTIFICATIONS"),
          NotificationBar(text: "Notifictions"),
          NotificationBar(text: "LIST SHARING"),
          NotificationBar(text: "New Shared Lists"),
          NotificationBar(text: "New List Items"),
         
        ],
      ),
    );
  }
}