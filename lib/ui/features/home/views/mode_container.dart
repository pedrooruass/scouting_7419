import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class ModeContainer extends StatefulWidget {
  final List<Widget> widgets;
  final String modeTitle;
  final bool isComments;
  final int totalPoints;

  const ModeContainer({
    super.key,
    required this.widgets,
    this.modeTitle = "Mode Title",
    this.isComments = false,
    this.totalPoints = 0,
  });

  @override
  State<ModeContainer> createState() => _ModeContainerState();
}

class _ModeContainerState extends State<ModeContainer> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: white,
              foregroundColor: black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                  bottomLeft: isToggled
                      ? const Radius.circular(0)
                      : const Radius.circular(10),
                  bottomRight: isToggled
                      ? const Radius.circular(0)
                      : const Radius.circular(10),
                ),
              ),
            ),
            onPressed: (() {
              setState(() {
                isToggled = !isToggled;
              });
            }),
            child: Row(
              children: [
                Image.asset(
                  isToggled
                      ? "assets/icons/arrow_down.png"
                      : "assets/icons/arrow_up.png",
                  height: 18,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 18),
                Text(
                  widget.modeTitle,
                  style: TextStyle(
                    fontSize: widget.isComments ? 14 : 18,
                    fontFamily: titleFont,
                  ),
                ),
                const Spacer(),
                widget.isComments
                    ? const SizedBox()
                    : Text(
                        widget.totalPoints.toString(),
                        style: const TextStyle(
                          fontSize: 26,
                          color: grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isToggled,
          replacement: const SizedBox.shrink(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: widget.widgets,
            ),
          ),
        ),
      ],
    );
  }
}
