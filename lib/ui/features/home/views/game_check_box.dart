import 'package:flutter/material.dart';

class GameCheckBoxTile extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final IconData icon;

  const GameCheckBoxTile({
    super.key,
    this.title = "Title",
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 38),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
