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
    required TournamentProvider tournamentProvider,
    required GameProvider gameProvider,
  }) async {
    ScoringModel scoringModel = ScoringModel(
      id: const Uuid().v4(),
      tournamentName: tournamentProvider.tournamentModel!.name,
      scouterName: profileProvider.userName!,
      teamNumber: teamProvider.teamModel!.teamNumber,
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
      commentsAuto: gameProvider.gameModel.commentsAutoController.text,
      commentsTeleOp: gameProvider.gameModel.commentsTeleOpController.text,
      commentsEndGame: gameProvider.gameModel.commentsEndGameController.text,
    );

    ScoringRepository scoringRepository = ScoringRepository();
    await scoringRepository.submitScoring(scoringModel); // reset game number
    gameProvider.reset();
    teamProvider.reset();
    tournamentProvider.reset();
  }
//game provider
//comments provider
}
