import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:scoring_7419/application/models/team_model.dart';
import 'package:scoring_7419/application/repositories/scoring_repository.dart';
import 'package:scoring_7419/ui/features/home/charts.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class TeamPage extends StatelessWidget {
  final TeamModel team; // shouldnt be TeamDataModel?

  const TeamPage({Key? key, required this.team}) : super(key: key);

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
          "Team Page",
          maxLines: 1,
          minFontSize: 12,
          style: TextStyle(
            fontSize: 32,
            fontFamily: titleFont,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    AutoSizeText(
                      "Loss",
                      style: TextStyle(
                        color: white,
                        fontFamily: titleFont,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText(
                      "23",
                      style: TextStyle(
                        color: red,
                        fontFamily: titleFont,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  maxRadius: 70,
                  backgroundColor: grey,
                  child: AutoSizeText(
                    "7419",
                    style: TextStyle(
                      color: black,
                      fontFamily: titleFont,
                      fontSize: 26,
                    ),
                  ),
                ),
                Column(
                  children: [
                    AutoSizeText(
                      "Win",
                      style: TextStyle(
                        color: white,
                        fontFamily: titleFont,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    AutoSizeText(
                      "34",
                      style: TextStyle(
                        color: green,
                        fontFamily: titleFont,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
            FlutterToggleTab(
              borderRadius: 10,
              height: 40,
              selectedIndex: 0,
              // selectedIndex:
              // gameProvider.gameModel.endGameHangerIndexSelected,
              selectedBackgroundColors: gradient1,
              selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              unSelectedTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              labels: const [
                "General",
                "S-Auto",
                "S-TeleOp",
                "S-EndGame",
                "Defensive",
              ],
              selectedLabelIndex: (index) {
                // gameProvider.endGameChangeHangerIndexSelected(index);
              },
              isScroll: false,
            ),
            SizedBox(
              height: 24,
            ),
            Charts(
              title: "Clasic Capital City - Data",
              // teamData: ,
              // teamDataList: getTeamData(),
            ),
          ],
        ),
      ),
    );
  }

  getTeamData() {
    // How to get the data
    ScoringRepository s = ScoringRepository();
    Stream<List<DataModel>> teamDataList;
    teamDataList = s.readTeamData(team.teamNumber);
  }

//  add all games of the team into a list, and filter how many they won and how many they lost
  Stream<List<DataModel>> readWinsTeamData(
    int teamNumber,
  ) =>
      FirebaseFirestore.instance
          .collection("scoring")
          .where("teamNumber", isEqualTo: teamNumber)
          .where("isWinner", isEqualTo: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => DataModel.fromJson(doc.data()))
              .toList());
}
