class DataModel {
  final String? id;

  final String? tournamentKey;
  final String? scouterName;
  final int teamNumber;
  final int matchNumber;
  final String? isAllianceBlue;

  // Autonomous
  final int autoUpperHubIn;
  final int autoLowerHubIn;
  final int autoUpperHubOut;
  final int autoLowerHubOut;
  final bool autoMovesOffTarmac;
  final int autoTotalPoints;

  // TeleOp
  final int teleOpUpperHubIn;
  final int teleOpLowerHubIn;
  final int teleOpUpperHubOut;
  final int teleOpLowerHubOut;
  final bool teleOpIsRobotDefensive;
  final int teleOpTotalPoints;

  // End Game
  final int endGameUpperHubIn;
  final int endGameLowerHubIn;
  final int endGameUpperHubOut;
  final int endGameLowerHubOut;
  final bool endGameIsRobotHanging;
  final bool endGameHaveScoreBonus;
  final bool endGameHaveHangerBonus;
  final int endGameTimeHanging;
  final int endGameHangerIndexSelected;
  final int endGameTotalPoints;

  final bool isWinner;
  final String? commentsAuto;
  final String? commentsTeleOp;
  final String? commentsEndGame;

  bool get isNotWinner => !isWinner;

  DataModel({
    required this.id,
    required this.tournamentKey,
    required this.scouterName,
    required this.teamNumber,
    required this.matchNumber,
    required this.isAllianceBlue,
    required this.autoUpperHubIn,
    required this.autoLowerHubIn,
    required this.autoUpperHubOut,
    required this.autoLowerHubOut,
    required this.autoMovesOffTarmac,
    required this.autoTotalPoints,
    required this.teleOpUpperHubIn,
    required this.teleOpLowerHubIn,
    required this.teleOpUpperHubOut,
    required this.teleOpLowerHubOut,
    required this.teleOpIsRobotDefensive,
    required this.teleOpTotalPoints,
    required this.endGameUpperHubIn,
    required this.endGameLowerHubIn,
    required this.endGameUpperHubOut,
    required this.endGameLowerHubOut,
    required this.endGameIsRobotHanging,
    required this.endGameHaveScoreBonus,
    required this.endGameHaveHangerBonus,
    required this.endGameTimeHanging,
    required this.endGameHangerIndexSelected,
    required this.endGameTotalPoints,
    required this.isWinner,
    required this.commentsAuto,
    required this.commentsTeleOp,
    required this.commentsEndGame,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel(
        id: json["id"],
        tournamentKey: json["tournamentKey"] ?? "",
        scouterName: json["scouterName"] ?? "",
        teamNumber: json["teamNumber"],
        matchNumber: json["matchNumber"],
        isAllianceBlue: json["isAllianceBlue"] ?? "",
        autoUpperHubIn: json["autoUpperHubIn"],
        autoLowerHubIn: json["autoLowerHubIn"],
        autoUpperHubOut: json["autoUpperHubOut"],
        autoLowerHubOut: json["autoLowerHubOut"],
        autoMovesOffTarmac: json["autoMovesOffTarmac"],
        autoTotalPoints: json["autoTotalPoints"],
        teleOpUpperHubIn: json["teleOpUpperHubIn"],
        teleOpLowerHubIn: json["teleOpLowerHubIn"],
        teleOpUpperHubOut: json["teleOpUpperHubOut"],
        teleOpLowerHubOut: json["teleOpLowerHubOut"],
        teleOpIsRobotDefensive: json["teleOpIsRobotDefensive"],
        teleOpTotalPoints: json["teleOpTotalPoints"],
        endGameUpperHubIn: json["endGameUpperHubIn"],
        endGameLowerHubIn: json["endGameLowerHubIn"],
        endGameUpperHubOut: json["endGameUpperHubOut"],
        endGameLowerHubOut: json["endGameLowerHubOut"],
        endGameIsRobotHanging: json["endGameIsRobotHanging"],
        endGameHaveScoreBonus: json["endGameHaveScoreBonus"],
        endGameHaveHangerBonus: json["endGameHaveHangerBonus"],
        endGameTimeHanging: json["endGameTimeHanging"],
        endGameHangerIndexSelected: json["endGameHangerIndexSelected"],
        endGameTotalPoints: json["endGameTotalPoints"],
        isWinner: json["isWinner"],
        commentsAuto: json["commentsAuto"] ?? "",
        commentsTeleOp: json["commentsTeleOp"] ?? "",
        commentsEndGame: json["commentsEndGame"] ?? "",
      );
}
