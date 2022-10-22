import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

Future<String?> displayTextInputDialog(BuildContext context,
    {required String title}) async {
  TextEditingController textFieldController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(
            hintText: "Team #",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black, width: 2.0),
            ),
          ),
          cursorColor: darkGrey,
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: white,
              foregroundColor: darkGrey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkGrey,
              foregroundColor: white,
            ),
            onPressed: () => Navigator.pop(context, textFieldController.text),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
