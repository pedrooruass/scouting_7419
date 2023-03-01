import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/team_visits_submit_provider.dart';
import 'package:scoring_7419/ui/features/home/views/mode_container.dart';
import 'package:scoring_7419/ui/features/home/views/tournament_search_container.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

import '../../../application/providers/profile_provider.dart';
import '../../../application/providers/team_visits_provider.dart';
import '../../../application/providers/tournament_provider.dart';
import '../../themee/colors.dart';
import '../home/views/team_and_scouter_row.dart';

class TeamVisitsPage extends StatelessWidget {
  const TeamVisitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: black,
        appBar: AppBar(backgroundColor: black, elevation: 0, centerTitle: true, title: AutoSizeText("Team Visits", maxFontSize: 36, maxLines: 1, style: TextStyle(fontSize: 48, fontFamily: titleFont, color: Colors.white))),
        body: Consumer<TeamProvider>(builder: (context, teamProvider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(height: 24),
                TournamentSearchContainer(
                  tournamentProvider: Provider.of<TournamentProvider>(context),
                ),
                const SizedBox(height: 24),
                TeamAndScouterRow(
                  teamProvider: teamProvider,
                ),
                const SizedBox(height: 24),
                ModeContainer(
                  isComments: true,
                  widgets: [
                    textVisitsField(question: "1- Do you use odometry", labelText: "</>", helperText: "Yes, they use a odometry from vision and encoders...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingQ1),
                    textVisitsField(question: "2- What camera do you use", labelText: "</>", helperText: "They use", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingQ2),
                    textVisitsField(question: "3- What do they automate", labelText: "</>", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingQ3),
                    textVisitsField(question: "4- What programming paradigm do they use", labelText: "</>", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingQ4),
                    textVisitsField(question: "5- Does your team use AprilTags?", labelText: "</>", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingQ5),
                    textVisitsField(question: "6- Does your team use the reflective tape?", labelText: "</>", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingQ6),
                    textVisitsField(question: "7- How large is your programming team", labelText: "</>", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingQ7),
                    textVisitsField(question: "8- How many programming mentors does your team have", labelText: "</>", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingQ8),
                    textVisitsField(question: "Extra Info", isExtraInfo: true, labelText: "</>", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.programingExtra),
                  ],
                  modeTitle: "Programming",
                ),
                const SizedBox(height: 24),
                ModeContainer(
                  isComments: true,
                  widgets: [
                    textVisitsField(question: "Drivetrain? Why", labelText: "🛠️", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.hardwareQ1),
                    textVisitsField(question: "Motors", labelText: "🛠️", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.hardwareQ2),
                    textVisitsField(question: "Scoring Mechanism", labelText: "🛠️", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.hardwareQ3),
                    textVisitsField(question: "Intake System", labelText: "🛠️", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.hardwareQ4),
                    textVisitsField(question: "Other prototypes you tried", labelText: "🛠️", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.hardwareQ5),
                    textVisitsField(question: "Unique aspect of robot", labelText: "🛠️", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.hardwareQ6),
                    textVisitsField(question: "Extra Info", isExtraInfo: true, labelText: "🛠️", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.hardwareExtra),
                  ],
                  modeTitle: "Hardware",
                ),
                const SizedBox(height: 24),
                ModeContainer(
                  isComments: true,
                  widgets: [
                    textVisitsField(question: "Budget? How do you handle finances", labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessQ1),
                    textVisitsField(question: "How early did you start working on Impact Award", labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessQ2),
                    textVisitsField(question: "Impact Award presentation", labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessQ3),
                    textVisitsField(question: "Impact Award video", labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessQ4),
                    textVisitsField(question: "Media", labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessQ5),
                    textVisitsField(question: "How did you attract Social Media attention", labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessQ6),
                    textVisitsField(question: "How to maintain/interact with sponsors", labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessQ7),
                    textVisitsField(question: "What outreach programs do you do", labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessQ8),
                    textVisitsField(question: "Extra Info", isExtraInfo: true, labelText: "💲", helperText: "AVG Auto, AVG TeleOp, Is Defensive, etc...", controller: context.read<TeamVisitsProvider>().teamVisitsModel.businessExtra),
                  ],
                  modeTitle: "Business",
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    print("ITS WORKING BITCH");
                    context.read<TeamVisitsSubmitProvider>().submitVisit(
                          teamProvider: teamProvider,
                          tournamentProvider: context.read<TournamentProvider>(),
                          profileProvider: context.read<ProfileProvider>(),
                          teamVisitsProvider: context.read<TeamVisitsProvider>(),
                          context: context,
                        );
                  },
                  child: Container(
                    height: 64,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: gradient2,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 24,
                        color: white,
                        fontFamily: titleFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget textVisitsField({required String question, required String labelText, required String helperText, required TextEditingController controller, bool isExtraInfo = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          isExtraInfo ? "$question:" : "$question?",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: TextFormField(
            cursorColor: darkGrey,
            controller: controller,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              labelText: labelText,
              helperText: "EX: $helperText",
              labelStyle: TextStyle(color: black, fontSize: 20),
              fillColor: grey,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: black)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: black)),
            ),
            maxLines: null,
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
