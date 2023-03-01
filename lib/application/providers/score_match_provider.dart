import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/scoring_model.dart';
import 'package:scoring_7419/application/providers/game_provider.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/application/repositories/scoring_repository.dart';
import 'package:uuid/uuid.dart';

class ScoreMatchProvider extends ChangeNotifier {
  Future<void> submitScore({
    required TeamProvider teamProvider,
    required ProfileProvider profileProvider,
    // required SecondRowProvider secondRowProvider,
    required TournamentProvider tournamentProvider,
    required GameProvider gameProvider,
    required BuildContext context,
  }) async {
    showDialog(
        context: context,
        builder: (context) {
          // return Center(child: CircularProgressIndicator(color: grey));
          return Center(child: Image.asset("assets/gif/7419_2.gif"));
        });
    ScoringModel scoringModel = ScoringModel(
      id: const Uuid().v4(),
      tournamentKey: tournamentProvider.tournamentModel!.key,
      // tournamentName: tournamentProvider.tournamentModel!.name,
      scouterName: profileProvider.userName!,
      teamNumber: teamProvider.teamModel!.teamNumber,
      matchNumber: gameProvider.gameModel.matchNumber,
      isAllianceBlue: gameProvider.gameModel.isAllianceBlue,
      autoTopRowCube: gameProvider.gameModel.autoTopRowCube,
      autoMiddleRowCube: gameProvider.gameModel.autoMiddleRowCube,
      autoBottomRowCube: gameProvider.gameModel.autoBottomRowCub,
      autoTopRowCone: gameProvider.gameModel.autoTopRowCone,
      autoMiddleRowCone: gameProvider.gameModel.autoMiddleRowCone,
      autoBottomRowCone: gameProvider.gameModel.autoBottomRowCone,
      autoLeavesCommunity: gameProvider.gameModel.autoLeavesCommunity,
      autoIsDocked: gameProvider.gameModel.autoIsDocked,
      autoIsEngaged: gameProvider.gameModel.autoIsEngaged,
      autoTotalPoints: gameProvider.gameModel.autoTotalPoints,
      teleOpTopRowCube: gameProvider.gameModel.teleOpTopRowCube,
      teleOpMiddleRowCube: gameProvider.gameModel.teleOpMiddleRowCube,
      teleOpBottomRowCube: gameProvider.gameModel.teleOpBottomRowCube,
      teleOpTopRowCone: gameProvider.gameModel.teleOpTopRowCone,
      teleOpMiddleRowCone: gameProvider.gameModel.teleOpMiddleRowCone,
      teleOpBottomRowCone: gameProvider.gameModel.teleOpBottomRowCone,
      teleOpLinks: gameProvider.gameModel.teleOpLinks,
      teleOpIsDocked: gameProvider.gameModel.teleOpIsDocked,
      teleOpIsEngaged: gameProvider.gameModel.teleOpIsEngaged,
      teleOpIsRobotParked: gameProvider.gameModel.teleOpIsRobotParked,
      teleOpIsRobotDefensive: gameProvider.gameModel.teleOpIsRobotDefensive,
      teleOpTotalPoints: gameProvider.gameModel.teleOpTotalPoints,
      isWinner: gameProvider.gameModel.isWinner,
      commentsAuto: gameProvider.gameModel.commentsAutoController.text,
      commentsTeleOp: gameProvider.gameModel.commentsTeleOpController.text,
      commentsEndGame: gameProvider.gameModel.commentsEndGameController.text,
    );

    ScoringRepository scoringRepository = ScoringRepository();
    await scoringRepository.submitScoring(scoringModel); // reset game number
    gameProvider.reset();
    teamProvider.reset();
    Navigator.pop(context);
    // secondRowProvider.reset();
    tournamentProvider.reset();
  }
//game provider
//comments provider
}
