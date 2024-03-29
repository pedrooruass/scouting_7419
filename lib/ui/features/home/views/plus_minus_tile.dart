import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/features/home/views/plus_minus_widget.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class PlusMinusTile extends StatelessWidget {
  final String title;
  final int hubPointsIn;
  final int hubPointsOut;
  final void Function() onPressedInMinus;
  final void Function() onPressedOutPlus;
  final void Function() onPressedInPlus;
  final void Function() onPressedOutMinus;

  const PlusMinusTile({
    Key? key,
    required this.title,
    required this.hubPointsIn,
    required this.hubPointsOut,
    required this.onPressedInMinus,
    required this.onPressedOutPlus,
    required this.onPressedInPlus,
    required this.onPressedOutMinus,
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
              onPressedMinus: onPressedOutMinus,
              hubPoints: hubPointsOut,
              onPressedPlus: onPressedOutPlus,
              color: red,
              subTitle: "Out",
            ),
            const SizedBox(width: 16),
            PlusMinusWidget(
              onPressedMinus: onPressedInMinus,
              hubPoints: hubPointsIn,
              onPressedPlus: onPressedInPlus,
              color: green,
              subTitle: "In",
            ),
          ],
        ),
      ],
    );
  }
}
