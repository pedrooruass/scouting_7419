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
      padding: const EdgeInsets.all(20),
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
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(child: AutoSizeText("Drive Train: ", maxLines: 2, minFontSize: 12, maxFontSize: 30, style: TextStyle(fontFamily: titleFont))),
                  Expanded(flex: 3, child: Center(child: Text("West Coast Drive", style: TextStyle(fontSize: 20)))),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),


          // questionRow(question1: "Drive Trains", question2: "Number", answer1: "West Coast Drive", answer2: "7419", isBigContainerLeft: true),
          // SizedBox(height: 24),
          // questionRow(question1: "Name", question2: "Motors", answer1: "Tech Support", answer2: "Falcon", isBigContainerLeft: false),
          // SizedBox(height: 24),
          // questionRow(question1: "Intake", question2: "School", answer1: "775 && Neo", answer2: "The Quarry Lane", isBigContainerLeft: true),
          // SizedBox(height: 24),
          // questionRow(question1: "Location", question2: "Shooter", answer1: "Dublin, CA", answer2: "Falcon", isBigContainerLeft: false),
          // SizedBox(height: 24),
          // questionRow(question1: "Field Strategy", question2: "Weight", answer1: "Offensive and defensive", answer2: "125 pounds", isBigContainerLeft: true),
          // SizedBox(height: 24),
          // questionRow(question1: "Climb", question2: "Scoring", answer1: "All of endgame → Traversal", answer2: "we usually score 15 points per game", isBigContainerLeft: false),
          // SizedBox(height: 24),
          // questionRow(question1: "AVG Auto Points", question2: "AVG TeleOp Points", answer1: "5", answer2: "10", isBigContainerLeft: true),
          // SizedBox(
          //   height: 24,
          // ),
          // SizedBox(height: 100, child: questionContainerWidget("Contact Information", "@7419tech : instagram", 1)),
          // SizedBox(height: 24),

          // questionAnswerWidget("Contact Information", "@7419tech : instagram"),
        ],
      ),
    );
  }

  Widget questionContainerWidget(String question, String answer, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 100,
        alignment: Alignment.center,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$question: ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: titleFont,
                color: black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              answer,
              style: TextStyle(
                fontSize: 15,
                fontFamily: bodyFont,
                color: black,
              ),
            ),
            // SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget questionRow({required String question1, required String answer1, required String question2, required String answer2, required bool isBigContainerLeft}) {
    return Row(
      children: [
        questionContainerWidget(question1, answer1, isBigContainerLeft ? 3 : 2),
        SizedBox(width: 24),
        questionContainerWidget(question2, answer2, isBigContainerLeft ? 2 : 3),
      ],
    );
  }
}
