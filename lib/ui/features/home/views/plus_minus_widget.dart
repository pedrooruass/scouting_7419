import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusMinusWidget extends StatelessWidget {
  final void Function() onPressedMinus;
  final int hubPoints;
  final void Function() onPressedPlus;
  final Color color;
  final String? subTitle;

  const PlusMinusWidget({
    Key? key,
    required this.onPressedMinus,
    required this.hubPoints,
    required this.onPressedPlus,
    required this.color,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        subTitle != null
            ? Text(subTitle!, style: TextStyle(fontSize: 12))
            : SizedBox.shrink(),
      ],
    );
  }
}
