import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialogs({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi ....",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text("Please login before you start", style: TextStyle()),
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: Text("Confirm"))],
    );
  }
}
