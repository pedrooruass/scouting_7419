import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class RobotInfo extends StatelessWidget {
  const RobotInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/arrow_left.png")),
        title: AutoSizeText(
          "Robot Info",
          maxLines: 1,
          minFontSize: 12,
          style: TextStyle(
            fontSize: 30,
            fontFamily: titleFont,
            color: white,
          ),
        ),
      ),
      body: robotInfoBody(),
    );
  }

  Widget robotInfoBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: Placeholder(),
            ),
          ),
          SizedBox(height: 24),
          questionAnswerWidget("Drive Trains", "West Coast Drive"),
          questionAnswerWidget("Motors", "We use Falcons for our Drivetrain"),
          questionAnswerWidget("Intake Mechanism", "Falcon(2)"),
          questionAnswerWidget("Shooter Mechanism", "775(1) Neo(1)"),
          questionAnswerWidget("Hanger Mechanism", "Falcon (2) Neo (2)"),
          questionAnswerWidget("Defense/Offense", "Offensive most of the time, but we can play defensive"),
          questionAnswerWidget("Weight", "125 pounds"),
          questionAnswerWidget("Scoring", "We shoot from the edge of the tarmac, or at the fender, we usually score 15 points per game"),
          questionAnswerWidget("Estimated Auton Points", "5"),
          questionAnswerWidget("Estimated TeleOp Points", "10"),
          questionAnswerWidget("Climb (time + what rung)", "All of endgame → Traversal"),
          questionAnswerWidget("Contact Information", "@7419tech : instagram"),
        ],
      ),
    );
  }

  Widget questionAnswerWidget(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$question: ",
          style: TextStyle(
            fontSize: 22,
            fontFamily: titleFont,
            color: yellow,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          answer,
          style: TextStyle(
            fontSize: 18,
            fontFamily: bodyFont,
            color: yellow,
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
