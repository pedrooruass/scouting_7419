import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/autonomous_provider.dart';
import 'package:scoring_7419/application/providers/end_game_provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/tele_op_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/features/home/views/comments_column_form.dart';
import 'package:scoring_7419/ui/features/home/views/game_check_box.dart';
import 'package:scoring_7419/ui/features/home/views/mode_container.dart';
import 'package:scoring_7419/ui/features/home/views/plus_minus_tile.dart';
import 'package:scoring_7419/ui/features/home/views/plus_minus_widget.dart';
import 'package:scoring_7419/ui/features/home/views/team_and_scouter_row.dart';
import 'package:scoring_7419/ui/features/home/views/title_and_profile.dart';
import 'package:scoring_7419/ui/features/home/views/tournament_search_container.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<TeamProvider, TournamentProvider>(
        builder: (context, teamProvider, tournamentProvider, widget) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        color: black,
        child: ListView(
          children: [
            TitleAndProfile(),
            const SizedBox(height: 24),
            TeamAndScouterRow(
              teamProvider: teamProvider,
              tournamentProvider: tournamentProvider,
            ),
            if (teamProvider.teamModel == null) ...[
              Image.asset(
                'assets/gif/7419_3.gif',
                height: 500,
                fit: BoxFit.cover,
              ),
            ],
            if (teamProvider.teamModel != null) ...[
              const SizedBox(height: 24),
              TournamentSearchContainer(
                  tournamentProvider: tournamentProvider,
                  teamProvider: teamProvider),
            ],
            if (tournamentProvider.tournamentModel != null) ...[
              const SizedBox(height: 24),
              // Autonomous
              autonomousContainer(),
              const SizedBox(height: 24),
              // Tele Op
              teleOpContainer(),
              const SizedBox(height: 24),
              // End Game
              endGameContainer(),
              const SizedBox(height: 24),
              // Additional Comments
              additionalCommentsContainer(),
              const SizedBox(height: 24),
              // Submit
              Container(
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.green,
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
            ]
          ],
        ),
      );
    });
  }

  ModeContainer additionalCommentsContainer() {
    return ModeContainer(
      isComments: true,
      modeTitle: "Aditional Comments",
      widgets: [
        CommentsColumnForm(title: "Auto"),
        const SizedBox(height: 24),
        CommentsColumnForm(title: "Tele Op"),
        const SizedBox(height: 24),
        CommentsColumnForm(title: "Eng Game"),
        const SizedBox(height: 24),
      ],
    );
  }

  Consumer<EndGameProvider> endGameContainer() {
    return Consumer<EndGameProvider>(
        builder: (context, endGameProvider, widget) {
      return ModeContainer(
        totalPoints: endGameProvider.calcTotal(),
        modeTitle: "End Game",
        widgets: [
          PlusMinusTile(
            title: "Upper Hub",
            hubPointsIn: endGameProvider.endGameUpperHubIn,
            hubPointsOut: endGameProvider.endGameUpperHubOut,
            onPressedInMinus: () {
              endGameProvider.decreaseUpperHubIn();
            },
            onPressedInPlus: () {
              endGameProvider.increaseUpperHubIn();
            },
            onPressedOutMinus: () {
              endGameProvider.decreaseUpperHubOut();
            },
            onPressedOutPlus: () {
              endGameProvider.increaseUpperHubOut();
            },
          ),
          const SizedBox(height: 24),
          PlusMinusTile(
            title: "Lower Hub",
            hubPointsIn: endGameProvider.endGameLowerHubIn,
            hubPointsOut: endGameProvider.endGameLowerHubOut,
            onPressedInMinus: () {
              endGameProvider.decreaseLowerHubIn();
            },
            onPressedInPlus: () {
              endGameProvider.increaseLowerHubIn();
            },
            onPressedOutMinus: () {
              endGameProvider.decreaseLowerHubOut();
            },
            onPressedOutPlus: () {
              endGameProvider.increaseLowerHubOut();
            },
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hanger",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
              GFToggle(
                value: endGameProvider.isRobotHanging,
                onChanged: (value) {
                  endGameProvider.checkIsRobotHanging(value!);
                },
                type: GFToggleType.square,
                enabledThumbColor: darkGrey,
                enabledTrackColor: grey,
                disabledThumbColor: darkGrey,
                disabledTrackColor: grey,
              ),
            ],
          ),
          Visibility(
            visible: endGameProvider.isRobotHanging,
            child: Column(
              children: [
                const SizedBox(height: 24),
                FlutterToggleTab(
                  borderRadius: 10,
                  height: 40,
                  selectedIndex: endGameProvider.hangerIndexSelected,
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
                    "Low",
                    "Mid",
                    "High",
                    "Traversal",
                    "Traversal", // Scrollable
                  ],
                  selectedLabelIndex: (index) {
                    endGameProvider.changeHangerIndexSelected(index);
                  },
                  isScroll: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Scoring Bonus",
            icon: endGameProvider.haveScoreBonus
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            onPressed: () {
              endGameProvider
                  .checkHaveScoreBonus(!endGameProvider.haveScoreBonus);
            },
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Hanger Bonus",
            icon: endGameProvider.haveHangerBonus
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            onPressed: () {
              endGameProvider
                  .checkHaveHangerBonus(!endGameProvider.haveHangerBonus);
            },
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text(
                "Time Hanging",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              PlusMinusWidget(
                onPressedMinus: () {
                  endGameProvider.decreaseTimeHanging();
                },
                hubPoints: endGameProvider.timeHanging,
                onPressedPlus: () {
                  endGameProvider.increaseTimeHanging();
                },
                color: darkGrey,
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      );
    });
  }

  Consumer<TeleOpProvider> teleOpContainer() {
    return Consumer<TeleOpProvider>(builder: (context, teleOpProvider, widget) {
      return ModeContainer(
        totalPoints: teleOpProvider.calcTotal(),
        modeTitle: "Tele Op",
        widgets: [
          PlusMinusTile(
            title: "Upper Hub",
            hubPointsIn: teleOpProvider.teleOpUpperHubIn,
            hubPointsOut: teleOpProvider.teleOpUpperHubOut,
            onPressedInMinus: () {
              teleOpProvider.decreaseUpperHubIn();
            },
            onPressedInPlus: () {
              teleOpProvider.increaseUpperHubIn();
            },
            onPressedOutMinus: () {
              teleOpProvider.decreaseUpperHubOut();
            },
            onPressedOutPlus: () {
              teleOpProvider.increaseUpperHubOut();
            },
          ),
          const SizedBox(height: 24),
          PlusMinusTile(
            title: "Lower Hub",
            hubPointsIn: teleOpProvider.teleOpLowerHubIn,
            hubPointsOut: teleOpProvider.teleOpLowerHubOut,
            onPressedInMinus: () {
              teleOpProvider.decreaseLowerHubIn();
            },
            onPressedInPlus: () {
              teleOpProvider.increaseLowerHubIn();
            },
            onPressedOutMinus: () {
              teleOpProvider.decreaseLowerHubOut();
            },
            onPressedOutPlus: () {
              teleOpProvider.increaseLowerHubOut();
            },
          ),
        ],
      );
    });
  }

  Consumer<AutonomousProvider> autonomousContainer() {
    return Consumer<AutonomousProvider>(
      builder: (context, autonomousProvider, widget) {
        return ModeContainer(
          modeTitle: "Autonomous",
          totalPoints: autonomousProvider.calcTotal(),
          widgets: [
            PlusMinusTile(
              title: "Upper Hub",
              hubPointsIn: autonomousProvider.autoUpperHubIn,
              hubPointsOut: autonomousProvider.autoUpperHubOut,
              onPressedInMinus: () {
                autonomousProvider.decreaseUpperHubIn();
              },
              onPressedInPlus: () {
                autonomousProvider.increaseUpperHubIn();
              },
              onPressedOutMinus: () {
                autonomousProvider.decreaseUpperHubOut();
              },
              onPressedOutPlus: () {
                autonomousProvider.increaseUpperHubOut();
              },
            ),
            const SizedBox(height: 24),
            PlusMinusTile(
              title: "Lower Hub",
              hubPointsIn: autonomousProvider.autoLowerHubIn,
              hubPointsOut: autonomousProvider.autoLowerHubOut,
              onPressedInMinus: () {
                autonomousProvider.decreaseLowerHubIn();
              },
              onPressedInPlus: () {
                autonomousProvider.increaseLowerHubIn();
              },
              onPressedOutMinus: () {
                autonomousProvider.decreaseLowerHubOut();
              },
              onPressedOutPlus: () {
                autonomousProvider.increaseLowerHubOut();
              },
            ),
            const SizedBox(height: 24),
            GameCheckBoxTile(
              title: "Moves Off Tarmac",
              icon: autonomousProvider.autoMovesOffTarmac
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              onPressed: () {
                autonomousProvider.autoToggleTarmac();
              },
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
