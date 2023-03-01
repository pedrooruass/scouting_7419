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
          questionContainerWidget("Drive Trains", "West Coast Drive"),
          SizedBox(height: 24),
          questionContainerWidget("Number", "7419"),
          SizedBox(height: 24),
          questionContainerWidget("Name", "Tech Support"),
          SizedBox(height: 24),
          questionContainerWidget("Motors", "Falcon"),
          SizedBox(height: 24),
          questionContainerWidget("Intake", "775 && Neo"),
          SizedBox(height: 24),
          questionContainerWidget("School", "The Quarry Lane"),
          SizedBox(height: 24),
          questionContainerWidget("Location of the team", "Dublin, CA"),
          SizedBox(height: 24),
          questionContainerWidget("Shooting mechanisms", "Falcon"),
          SizedBox(height: 24),
          questionContainerWidget("Field Strategy", "Offensive and Defensive"),
          SizedBox(height: 24),
          questionContainerWidget("Weight", "125 pounds"),
          SizedBox(height: 24),
          questionContainerWidget("AVG Auto Points", "5"),
          SizedBox(height: 24),
          questionContainerWidget("AVG TeleOp Points", "10"),
          SizedBox(height: 24),
          questionContainerWidget("Contact Information", "@7419tech : instagram"),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget questionContainerWidget(String question, String answer) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(child: AutoSizeText("$question", maxLines: 2, minFontSize: 4, style: TextStyle(fontFamily: titleFont))),
            Expanded(flex: 3, child: Center(child: Text(answer, style: TextStyle(fontSize: 20)))),
          ],
        ),
      ),
    );
  }
}
