import 'package:flutter/material.dart';
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
              Expanded(
                child: Image.asset(
                  'assets/gif/7419_3.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ],
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
              const SizedBox(height: 24),
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

  Consumer<GameProvider> teleOpContainer() {
    return Consumer<GameProvider>(builder: (context, gameProvider, widget) {
      return ModeContainer(
        totalPoints: gameProvider.calcTeleOpTotalPoints(),
        modeTitle: "Tele Op",
        widgets: [
          PlusMinusTile(
            title: "Top Row",
            hubPointsIn: gameProvider.gameModel.teleOpTopRowIn,
            hubPointsOut: gameProvider.gameModel.teleOpTopRowOut,
            onPressedInMinus: () {
              gameProvider.teleOpDecreaseTopRowIn();
            },
            onPressedInPlus: () {
              gameProvider.teleOpIncreaseTopRowIn();
            },
            onPressedOutMinus: () {
              gameProvider.teleOpDecreaseTopRowOut();
            },
            onPressedOutPlus: () {
              gameProvider.teleOpIncreaseTopRowOut();
            },
          ),
          const SizedBox(height: 24),
          PlusMinusTile(
            title: "Middle Row",
            hubPointsIn: gameProvider.gameModel.teleOpMiddleRowIn,
            hubPointsOut: gameProvider.gameModel.teleOpMiddleRowOut,
            onPressedInMinus: () {
              gameProvider.teleOpDecreaseMiddleRowIn();
            },
            onPressedInPlus: () {
              gameProvider.teleOpIncreaseMiddleRowIn();
            },
            onPressedOutMinus: () {
              gameProvider.teleOpDecreaseMiddleRowOut();
            },
            onPressedOutPlus: () {
              gameProvider.teleOpIncreaseMiddleRowOut();
            },
          ),
          const SizedBox(height: 24),
          PlusMinusTile(
            title: "Bottom Row",
            hubPointsIn: gameProvider.gameModel.teleOpBottomRowIn,
            hubPointsOut: gameProvider.gameModel.teleOpBottomRowOut,
            onPressedInMinus: () {
              gameProvider.teleOpDecreaseBottomRowIn();
            },
            onPressedInPlus: () {
              gameProvider.teleOpIncreaseBottomRowIn();
            },
            onPressedOutMinus: () {
              gameProvider.teleOpDecreaseBottomRowOut();
            },
            onPressedOutPlus: () {
              gameProvider.teleOpIncreaseBottomRowOut();
            },
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Text("Links", style: const TextStyle(fontSize: 22)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlusMinusWidget(
                    onPressedMinus: () {
                      gameProvider.teleOpDecreaseLinks();
                    },
                    hubPoints: gameProvider.gameModel.teleOpLinks,
                    onPressedPlus: () {
                      gameProvider.teleOpIncreaseLinks();
                    },
                    color: autoColor,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Is Robot Docked?",
            icon: gameProvider.gameModel.teleOpIsDocked ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            onPressed: () {
              gameProvider.teleOpToggleIsDocked(!gameProvider.gameModel.teleOpIsDocked);
            },
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Is Robot Engaged?",
            icon: gameProvider.gameModel.teleOpIsEngaged ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            onPressed: () {
              gameProvider.teleOpToggleIsEngaged(!gameProvider.gameModel.teleOpIsEngaged);
            },
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Is Robot Parked?",
            icon: gameProvider.gameModel.teleOpIsRobotParked ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            onPressed: () {
              gameProvider.teleOpToggleIsRobotParked(!gameProvider.gameModel.teleOpIsRobotParked);
            },
          ),
          const SizedBox(height: 24),
          GameCheckBoxTile(
            title: "Is Robot Defensive?",
            icon: gameProvider.gameModel.teleOpIsRobotDefensive ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            onPressed: () {
              gameProvider.teleOpToggleIsRobotDefensive(!gameProvider.gameModel.teleOpIsRobotDefensive);
            },
          ),
          const SizedBox(height: 24),
          Text("Time Hold Button"),
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
              title: "Top Row",
              hubPointsIn: gameProvider.gameModel.autoTopRowIn,
              hubPointsOut: gameProvider.gameModel.autoTopRowOut,
              onPressedInMinus: () {
                gameProvider.autoDecreaseTopRowIn();
              },
              onPressedInPlus: () {
                gameProvider.autoIncreaseTopRowIn();
              },
              onPressedOutMinus: () {
                gameProvider.autoDecreaseTopRowOut();
              },
              onPressedOutPlus: () {
                gameProvider.autoIncreaseTopRowOut();
              },
            ),
            const SizedBox(height: 24),
            PlusMinusTile(
              title: "Middle Row",
              hubPointsIn: gameProvider.gameModel.autoMiddleRowIn,
              hubPointsOut: gameProvider.gameModel.autoMiddleRowOut,
              onPressedInMinus: () {
                gameProvider.autoDecreaseMiddleRowIn();
              },
              onPressedInPlus: () {
                gameProvider.autoIncreaseMiddleRowIn();
              },
              onPressedOutMinus: () {
                gameProvider.autoDecreaseMiddleRowOut();
              },
              onPressedOutPlus: () {
                gameProvider.autoIncreaseMiddleRowOut();
              },
            ),
            const SizedBox(height: 24),
            PlusMinusTile(
              title: "Bottom Row",
              hubPointsIn: gameProvider.gameModel.autoBottomRowIn,
              hubPointsOut: gameProvider.gameModel.autoBottomRowOut,
              onPressedInMinus: () {
                gameProvider.autoDecreaseBottomRowIn();
              },
              onPressedInPlus: () {
                gameProvider.autoIncreaseBottomRowIn();
              },
              onPressedOutMinus: () {
                gameProvider.autoDecreaseBottomRowOut();
              },
              onPressedOutPlus: () {
                gameProvider.autoIncreaseBottomRowOut();
              },
            ),
            const SizedBox(height: 24),
            GameCheckBoxTile(
              title: "Leaves Community?",
              icon: gameProvider.gameModel.autoLeavesCommunity ? Icons.check_box_outlined : Icons.check_box_outline_blank,
              onPressed: () {
                gameProvider.autoToggleLeavesCommunity();
              },
            ),
            const SizedBox(height: 24),
            GameCheckBoxTile(
              title: "Is Robot Docked?",
              icon: gameProvider.gameModel.autoIsDocked ? Icons.check_box_outlined : Icons.check_box_outline_blank,
              onPressed: () {
                gameProvider.autoToggleDocked();
              },
            ),
            const SizedBox(height: 24),
            GameCheckBoxTile(
              title: "Is Robot Engaged?",
              icon: gameProvider.gameModel.autoIsEngaged ? Icons.check_box_outlined : Icons.check_box_outline_blank,
              onPressed: () {
                gameProvider.autoToggleEngaged();
              },
            ),
            const SizedBox(height: 24),
            Text("Time Hold Button"),
          ],
        );
      },
    );
  }
}
