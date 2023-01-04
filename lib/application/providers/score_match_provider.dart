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
      autoUpperHubIn: gameProvider.gameModel.autoUpperHubIn,
      autoUpperHubOut: gameProvider.gameModel.autoUpperHubOut,
      autoLowerHubIn: gameProvider.gameModel.autoLowerHubIn,
      autoLowerHubOut: gameProvider.gameModel.autoLowerHubOut,
      autoTotalPoints: gameProvider.gameModel.autoTotalPoints,
      autoMovesOffTarmac: gameProvider.gameModel.autoMovesOffTarmac,
      teleOpUpperHubIn: gameProvider.gameModel.teleOpUpperHubIn,
      teleOpUpperHubOut: gameProvider.gameModel.teleOpUpperHubOut,
      teleOpLowerHubIn: gameProvider.gameModel.teleOpLowerHubIn,
      teleOpLowerHubOut: gameProvider.gameModel.teleOpLowerHubOut,
      teleOpIsRobotDefensive: gameProvider.gameModel.teleOpIsRobotDefensive,
      teleOpTotalPoints: gameProvider.gameModel.teleOpTotalPoints,
      endGameUpperHubIn: gameProvider.gameModel.endGameUpperHubIn,
      endGameUpperHubOut: gameProvider.gameModel.endGameUpperHubOut,
      endGameLowerHubIn: gameProvider.gameModel.endGameLowerHubIn,
      endGameLowerHubOut: gameProvider.gameModel.endGameLowerHubOut,
      endGameTotalPoints: gameProvider.gameModel.endGameTotalPoints,
      endGameIsRobotHanging: gameProvider.gameModel.endGameIsRobotHanging,
      endGameHaveScoreBonus: gameProvider.gameModel.endGameHaveScoreBonus,
      endGameHaveHangerBonus: gameProvider.gameModel.endGameHaveHangerBonus,
      endGameTimeHanging: gameProvider.gameModel.endGameTimeHanging,
      endGameHangerIndexSelected: gameProvider.gameModel.endGameHangerIndexSelected,
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
