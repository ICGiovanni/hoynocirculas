import 'package:flutter/material.dart';

class Helpers {
  static showSnackbar(BuildContext context, String errorMessage,
      [bool ok = true]) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: !ok ? Colors.red : Colors.green,
        content: Text(
          errorMessage,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
