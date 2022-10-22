import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

Future<String?> displayTextDialog(BuildContext context,
    {required String title}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title, style: const TextStyle(color: red)),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkGrey,
              foregroundColor: white,
            ),
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
