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
    double height = MediaQuery.of(context).size.height;
    return Consumer<TeamProvider>(
        //TODO Make it Consumer2, with the tournament provider
        builder: (context, teamProvider, widget) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          color: black,
          child: ListView(
            children: [
              TitleAndProfile(),
              const SizedBox(height: 24),
              TournamentSearchContainer(
                tournamentProvider: Provider.of<TournamentProvider>(context),
              ),
              const SizedBox(height: 24),
              TeamAndScouterRow(
                teamProvider: teamProvider,
                // tournamentProvider: tournamentProvider,
              ),
              if (teamProvider.teamModel == null) ...[
                Image.asset(
                  'assets/gif/7419_3.gif',
                  height: height > 667 ? 500 : 350,
                  fit: BoxFit.cover,
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
                          gameProvider: context.read<GameProvider>(),
                          context: context,
                        );
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
        ),
      );
    });
  }

  Consumer<GameProvider> additionalCommentsContainer(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gameProvider, widget) {
      return ModeContainer(
        isComments: true,
        modeTitle: "Additional Info",
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
            hubPointsCube: gameProvider.gameModel.teleOpTopRowCube,
            hubPointsCone: gameProvider.gameModel.teleOpTopRowCone,
            onPressedCubeMinus: () {
              gameProvider.teleOpDecreaseTopRowCube();
            },
            onPressedCubePlus: () {
              gameProvider.teleOpIncreaseTopRowCube();
            },
            onPressedConeMinus: () {
              gameProvider.teleOpDecreaseTopRowCone();
            },
            onPressedConePlus: () {
              gameProvider.teleOpIncreaseTopRowCone();
            },
          ),
          const SizedBox(height: 24),
          PlusMinusTile(
            title: "Middle Row",
            hubPointsCube: gameProvider.gameModel.teleOpMiddleRowCube,
            hubPointsCone: gameProvider.gameModel.teleOpMiddleRowCone,
            onPressedCubeMinus: () {
              gameProvider.teleOpDecreaseMiddleRowCube();
            },
            onPressedCubePlus: () {
              gameProvider.teleOpIncreaseMiddleRowCube();
            },
            onPressedConeMinus: () {
              gameProvider.teleOpDecreaseMiddleRowCone();
            },
            onPressedConePlus: () {
              gameProvider.teleOpIncreaseMiddleRowCone();
            },
          ),
          const SizedBox(height: 24),
          PlusMinusTile(
            title: "Bottom Row",
            hubPointsCube: gameProvider.gameModel.teleOpBottomRowCube,
            hubPointsCone: gameProvider.gameModel.teleOpBottomRowCone,
            onPressedCubeMinus: () {
              gameProvider.teleOpDecreaseBottomRowCube();
            },
            onPressedCubePlus: () {
              gameProvider.teleOpIncreaseBottomRowCube();
            },
            onPressedConeMinus: () {
              gameProvider.teleOpDecreaseBottomRowCone();
            },
            onPressedConePlus: () {
              gameProvider.teleOpIncreaseBottomRowCone();
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
              hubPointsCube: gameProvider.gameModel.autoTopRowCube,
              hubPointsCone: gameProvider.gameModel.autoTopRowCone,
              onPressedCubeMinus: () {
                gameProvider.autoDecreaseTopRowCube();
              },
              onPressedCubePlus: () {
                gameProvider.autoIncreaseTopRowCube();
              },
              onPressedConeMinus: () {
                gameProvider.autoDecreaseTopRowCone();
              },
              onPressedConePlus: () {
                gameProvider.autoIncreaseTopRowCone();
              },
            ),
            const SizedBox(height: 24),
            PlusMinusTile(
              title: "Middle Row",
              hubPointsCube: gameProvider.gameModel.autoMiddleRowCube,
              hubPointsCone: gameProvider.gameModel.autoMiddleRowCone,
              onPressedCubeMinus: () {
                gameProvider.autoDecreaseMiddleRowCube();
              },
              onPressedCubePlus: () {
                gameProvider.autoIncreaseMiddleRowCube();
              },
              onPressedConeMinus: () {
                gameProvider.autoDecreaseMiddleRowCone();
              },
              onPressedConePlus: () {
                gameProvider.autoIncreaseMiddleRowCone();
              },
            ),
            const SizedBox(height: 24),
            PlusMinusTile(
              title: "Bottom Row",
              hubPointsCube: gameProvider.gameModel.autoBottomRowCub,
              hubPointsCone: gameProvider.gameModel.autoBottomRowCone,
              onPressedCubeMinus: () {
                gameProvider.autoDecreaseBottomRowCube();
              },
              onPressedCubePlus: () {
                gameProvider.autoIncreaseBottomRowCube();
              },
              onPressedConeMinus: () {
                gameProvider.autoDecreaseBottomRowCone();
              },
              onPressedConePlus: () {
                gameProvider.autoIncreaseBottomRowCone();
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
          ],
        );
      },
    );
  }
}
