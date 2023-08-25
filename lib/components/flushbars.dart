import 'package:flutter/material.dart';

import 'package:list_me/components/background.dart';
import 'package:list_me/components/delete_icon.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
// import 'package:telegram_undo/widgets/CountDownWidget.dart';



class FlushBars {

    dynamic undo( {

    required String message,
    required VoidCallback onUndo,
    required Duration duration,
  }
  )
  {
    return Flushbar (
      messageText: Text (
        message,
        style: const TextStyle(color: Colors.white),
      ),
      icon: CountDownWidget(duration: duration),
      backgroundColor: Colors.black,
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: duration,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      mainButton: TextButton(onPressed: onUndo, 
      child: const Text("Undo"),
      ),
    );
  }
}
