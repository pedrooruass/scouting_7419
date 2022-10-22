import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusMinusWidget extends StatelessWidget {
  void Function() onPressedMinus;
  int hubPoints;
  void Function() onPressedPlus;
  Color color;
  PlusMinusWidget({
    Key? key,
    required this.onPressedMinus,
    required this.hubPoints,
    required this.onPressedPlus,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.squareMinus),
          onPressed: onPressedMinus,
        ),
        const SizedBox(width: 12),
        Text(hubPoints.toString(),
            style: TextStyle(fontSize: 22, color: color)),
        const SizedBox(width: 12),
        IconButton(
          icon: const Icon(FontAwesomeIcons.squarePlus),
          onPressed: onPressedPlus,
        ),
      ],
    );
  }
}
