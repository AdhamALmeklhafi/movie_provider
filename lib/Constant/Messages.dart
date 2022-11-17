import 'package:flutter/material.dart';

class Mesg {
  static final mesagKey = GlobalKey<ScaffoldMessengerState>();

  static showSnakeBar(String? text, Color color) {
    if (text == null) return;
    final snakBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
      duration: Duration(
        seconds: 2,
      ),
    );

    mesagKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snakBar);
  }
}
