import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class CommentsColumnForm extends StatelessWidget {
  final String title;
  final TextEditingController commentsController;

  const CommentsColumnForm(
      {super.key, this.title = "Title", required this.commentsController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 16),
          height: 40,
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: black),
          ),
          child: TextFormField(
            controller: commentsController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter Comments",
            ),
            cursorColor: darkGrey,
          ),
        ),
      ],
    );
  }
}
