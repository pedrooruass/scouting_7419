import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/features/home/views/plus_minus_widget.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class PlusMinusTile extends StatelessWidget {
  final String title;
  final int hubPointsCube;
  final int hubPointsCone;
  final void Function() onPressedCubeMinus;
  final void Function() onPressedConePlus;
  final void Function() onPressedCubePlus;
  final void Function() onPressedConeMinus;

  const PlusMinusTile({
    Key? key,
    required this.title,
    required this.hubPointsCube,
    required this.hubPointsCone,
    required this.onPressedCubeMinus,
    required this.onPressedConePlus,
    required this.onPressedCubePlus,
    required this.onPressedConeMinus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PlusMinusWidget(
              onPressedMinus: onPressedConeMinus,
              hubPoints: hubPointsCone,
              onPressedPlus: onPressedConePlus,
              color: orange,
              subTitle: "Cones",
            ),
            const SizedBox(width: 16),
            PlusMinusWidget(
              onPressedMinus: onPressedCubeMinus,
              hubPoints: hubPointsCube,
              onPressedPlus: onPressedCubePlus,
              color: purple,
              subTitle: "Cubes",
            ),
          ],
        ),
      ],
    );
  }
}
