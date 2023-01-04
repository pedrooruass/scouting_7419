import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/game_provider.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/application/providers/score_match_provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/ui/features/home/views/comments_column_form.dart';
import 'package:scoring_7419/ui/features/home/views/game_check_box.dart';
import 'package:scoring_7419/ui/features/home/views/mode_container.dart';
import 'package:scoring_7419/ui/features/home/views/plus_minus_tile.dart';
import 'package:scoring_7419/ui/features/home/views/plus_minus_widget.dart';
import 'package:scoring_7419/ui/features/home/views/second_row.dart';
import 'package:scoring_7419/ui/features/home/views/team_and_scouter_row.dart';
import 'package:scoring_7419/ui/features/home/views/title_and_profile.dart';
import 'package:scoring_7419/ui/features/home/views/tournament_search_container.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

import '../../../application/providers/tournament_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    if (context.read<TournamentProvider>().tournamentModels.isEmpty) {
      context.read<TournamentProvider>().getTournamentModels();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamProvider>(
        //TODO Make it Consumer2, with the tournament provider
        builder: (context, teamProvider, widget) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        color: black,
        child: ListView(
          children: [
            TitleAndProfile(),
            const SizedBox(height: 24),
            TournamentSearchContainer(
              tournamentProvider: Provider.of<TournamentProvider>(context),
              teamProvider: teamProvider,
            ),
            const SizedBox(height: 24),
            TeamAndScouterRow(
              teamProvider: teamProvider,
              // tournamentProvider: tournamentProvider,
            ),
            if (teamProvider.teamModel == null) ...[
              Image.asset(
                'assets/gif/7419_3.gif',
                height: 500,
                fit: BoxFit.cover,
              ),
            ],
            // if (teamProvider.teamModel != null) ...[
            //   const SizedBox(height: 24),
            //   TournamentSearchContainer(tournamentProvider: tournamentProvider, teamProvider: teamProvider),
            // ],
            // if (tournamentProvider.tournamentModel != null) ...[
            if (teamProvider.teamModel != null) ...[
              const SizedBox(height: 24),
              SecondRow(),
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
              additionalCommentsContainer(context),
              const SizedBox(height: 24),
              // Submit
              GestureDetector(
                onTap: () {
                  context.read<ScoreMatchProvider>().submitScore(
                        teamProvider: teamProvider,
                        tournamentProvider: context.read<TournamentProvider>(),
                        profileProvider: context.read<ProfileProvider>(),
                        // secondRowProvider: context.read<SecondRowProvider>(),
                        gameProvider: context.read<GameProvider>(),
                        context: context,
                      );
                  // Navigator.pop(context);
                },
                child: Container(
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
              ),
            ]
          ],
        ),
      );
    });
  }

  Consumer<GameProvider> additionalCommentsContainer(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gameProvider, widget) {
      return ModeContainer(
        isComments: true,
        modeTitle: "Aditional Info",
        widgets: [
          GameCheckBoxTile(
            title: "Is winner?",
            icon: gameProvider.gameModel.isWinner ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            onPressed: () {
              gameProvider.isWinnerToggle();
            },
          ),
          const SizedBox(height: 24),
          CommentsColumnForm(title: "Auto", commentsController: context.read<GameProvider>().gameModel.commentsAutoController),
          const SizedBox(height: 24),
          CommentsColumnForm(title: "Tele Op", commentsController: context.read<GameProvider>().gameModel.commentsTeleOpController),
          const SizedBox(height: 24),
          CommentsColumnForm(title: "End Game", commentsController: context.read<GameProvider>().gameModel.commentsEndGameController),
          const SizedBox(height: 24),
        ],
      );
    });
  }

  Consumer<GameProvider> endGameContainer() {
    return Consumer<GameProvider>(builder: (context, gameProvider, widget) {
      return ModeContainer(
        totalPoints: gameProvider.calcEndGameTotal(),
        modeTitle: "End Game",
        widgets: [
          PlusMinusTile(
            title: "Upper Hub",
            hubPointsIn: gameProvider.gameModel.endGameUpperHubIn,
            hubPointsOut: gameProvider.gameModel.endGameUpperHubOut,
            onPressedInMinus: () {
              gameProvider.endGameDecreaseUpperHubIn();
            },
            onPressedInPlus: () {
              gameProvider.endGameIncreaseUpperHubIn();
            },
            onPressedOutMinus: () {
              gameProvider.endGameDecreaseUpperHubOut();
            },
            onPressedOutPlus: () {
              gameProvider.endGameIncreaseUpperHubOut();
            },
          ),
          const SizedBox(height: 24),
          PlusMinusTile(
            title: "Lower Hub",
            hubPointsIn: gameProvider.gameModel.endGameLowerHubIn,
            hubPointsOut: gameProvider.gameModel.endGameLowerHubOut,
            onPressedInMinus: () {
              gameProvider.endGameDecreaseLowerHubIn();
            },
            onPressedInPlus: () {
              gameProvider.endGameIncreaseLowerHubIn();
            },
            onPressedOutMinus: () {
              gameProvider.endGameDecreaseLowerHubOut();
            },
            onPressedOutPlus: () {
              gameProvider.endGameIncreaseLowerHubOut();
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
                value: gameProvider.gameModel.endGameIsRobotHanging,
                onChanged: (value) {
                  gameProvider.endGameCheckIsRobotHanging(value!);
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
            visible: gameProvider.gameModel.endGameIsRobotHanging,
            child: Column(
              children: [
                const SizedBox(height: 24),
                FlutterToggleTab(
                  borderRadius: 10,
                  height: 40,
                  selectedIndex: gameProvider.gameModel.endGameHangerIndexSelected,
                  selectedBackgroundColors: gradient1,
                  selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                  unSelectedTextStyle: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
                  labels: const [
                    "Low",
                    "Mid",
                    "High",
                    "Traversal",
                    "Traversal", // Scrollable
                  ],
                  selectedLabelIndex: (index) {
                    gameProvider.endGameChangeHangerIndexSelected(index);
                  },
                  isScroll: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Scoring Bonus",
            icon: gameProvider.gameModel.endGameHaveScoreBonus ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            onPressed: () {
              gameProvider.endGameCheckHaveScoreBonus(!gameProvider.gameModel.endGameHaveScoreBonus);
            },
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Hanger Bonus",
            icon: gameProvider.gameModel.endGameHaveHangerBonus ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            onPressed: () {
              gameProvider.endGameCheckHaveHangerBonus(!gameProvider.gameModel.endGameHaveHangerBonus);
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
                  gameProvider.endGameDecreaseTimeHanging();
                },
                hubPoints: gameProvider.gameModel.endGameTimeHanging,
                onPressedPlus: () {
                  gameProvider.endGameIncreaseTimeHanging();
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

  Consumer<GameProvider> teleOpContainer() {
    return Consumer<GameProvider>(builder: (context, gameProvider, widget) {
      return ModeContainer(
        totalPoints: gameProvider.calcTeleOpTotal(),
        modeTitle: "Tele Op",
        widgets: [
          PlusMinusTile(
            title: "Upper Hub",
            hubPointsIn: gameProvider.gameModel.teleOpUpperHubIn,
            hubPointsOut: gameProvider.gameModel.teleOpUpperHubOut,
            onPressedInMinus: () {
              gameProvider.teleOpDecreaseUpperHubIn();
            },
            onPressedInPlus: () {
              gameProvider.teleOpIncreaseUpperHubIn();
            },
            onPressedOutMinus: () {
              gameProvider.teleOpDecreaseUpperHubOut();
            },
            onPressedOutPlus: () {
              gameProvider.teleOpIncreaseUpperHubOut();
            },
          ),
          const SizedBox(height: 24),
          PlusMinusTile(
            title: "Lower Hub",
            hubPointsIn: gameProvider.gameModel.teleOpLowerHubIn,
            hubPointsOut: gameProvider.gameModel.teleOpLowerHubOut,
            onPressedInMinus: () {
              gameProvider.teleOpDecreaseLowerHubIn();
            },
            onPressedInPlus: () {
              gameProvider.teleOpIncreaseLowerHubIn();
            },
            onPressedOutMinus: () {
              gameProvider.teleOpDecreaseLowerHubOut();
            },
            onPressedOutPlus: () {
              gameProvider.teleOpIncreaseLowerHubOut();
            },
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Is Robot Defensive",
            icon: gameProvider.gameModel.teleOpIsRobotDefensive ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            onPressed: () {
              gameProvider.teleOpToggleIsRobotDefensive(!gameProvider.gameModel.teleOpIsRobotDefensive);
            },
          ),
        ],
      );
    });
  }

  Consumer<GameProvider> autonomousContainer() {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, widget) {
        return ModeContainer(
          modeTitle: "Autonomous",
          totalPoints: gameProvider.calcAutoTotal(),
          widgets: [
            PlusMinusTile(
              title: "Upper Hub",
              hubPointsIn: gameProvider.gameModel.autoUpperHubIn,
              hubPointsOut: gameProvider.gameModel.autoUpperHubOut,
              onPressedInMinus: () {
                gameProvider.autoDecreaseUpperHubIn();
              },
              onPressedInPlus: () {
                gameProvider.autoIncreaseUpperHubIn();
              },
              onPressedOutMinus: () {
                gameProvider.autoDecreaseUpperHubOut();
              },
              onPressedOutPlus: () {
                gameProvider.autoIncreaseUpperHubOut();
              },
            ),
            const SizedBox(height: 24),
            PlusMinusTile(
              title: "Lower Hub",
              hubPointsIn: gameProvider.gameModel.autoLowerHubIn,
              hubPointsOut: gameProvider.gameModel.autoLowerHubOut,
              onPressedInMinus: () {
                gameProvider.autoDecreaseLowerHubIn();
              },
              onPressedInPlus: () {
                gameProvider.autoIncreaseLowerHubIn();
              },
              onPressedOutMinus: () {
                gameProvider.autoDecreaseLowerHubOut();
              },
              onPressedOutPlus: () {
                gameProvider.autoIncreaseLowerHubOut();
              },
            ),
            const SizedBox(height: 24),
            GameCheckBoxTile(
              title: "Moves Off Tarmac",
              icon: gameProvider.gameModel.autoMovesOffTarmac ? Icons.check_box_outlined : Icons.check_box_outline_blank,
              onPressed: () {
                gameProvider.autoToggleTarmac();
              },
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
