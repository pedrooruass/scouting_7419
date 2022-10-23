class ScoringModel {
  final String id;
  final String tournamentName;
  final String scouterName;
  final int teamNumber;
  final int gameNumber;

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
  final int teleOpTotalPoints;

  // End Game
  final int endGameUpperHubIn;
  final int endGameLowerHubIn;
  final int endGameUpperHubOut;
  final int endGameLowerHubOut;
  final int endGameTotalPoints;
  final bool endGameIsRobotHanging;
  final bool endGameHaveScoreBonus;
  final bool endGameHaveHangerBonus;
  final int endGameTimeHanging;
  final int endGameHangerIndexSelected;

  //Comments
  final String commentsAuto;
  final String commentsTeleOp;
  final String commentsEndGame;

  ScoringModel({
    required this.id,
    required this.tournamentName,
    required this.scouterName,
    required this.teamNumber,
    required this.gameNumber,
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
    required this.teleOpTotalPoints,
    required this.endGameUpperHubIn,
    required this.endGameLowerHubIn,
    required this.endGameUpperHubOut,
    required this.endGameLowerHubOut,
    required this.endGameTotalPoints,
    required this.endGameIsRobotHanging,
    required this.endGameHaveScoreBonus,
    required this.endGameHaveHangerBonus,
    required this.endGameTimeHanging,
    required this.endGameHangerIndexSelected,
    required this.commentsAuto,
    required this.commentsTeleOp,
    required this.commentsEndGame,
  });

  factory ScoringModel.fromJson(Map<String, dynamic> json) {
    return ScoringModel(
      id: json['id'],
      tournamentName: json['tournamentName'],
      scouterName: json['scouterName'],
      teamNumber: json['teamNumber'],
      gameNumber: json['gameNumber'],
      autoUpperHubIn: json['autoUpperHubIn'],
      autoLowerHubIn: json['autoLowerHubIn'],
      autoUpperHubOut: json['autoUpperHubOut'],
      autoLowerHubOut: json['autoLowerHubOut'],
      autoTotalPoints: json['autoTotalPoints'],
      autoMovesOffTarmac: json['autoMovesOffTarmac'],
      teleOpUpperHubIn: json['teleOpUpperHubIn'],
      teleOpLowerHubIn: json['teleOpLowerHubIn'],
      teleOpUpperHubOut: json['teleOpUpperHubOut'],
      teleOpLowerHubOut: json['teleOpLowerHubOut'],
      teleOpTotalPoints: json['teleOpTotalPoints'],
      endGameUpperHubIn: json['endGameUpperHubIn'],
      endGameLowerHubIn: json['endGameLowerHubIn'],
      endGameUpperHubOut: json['endGameUpperHubOut'],
      endGameLowerHubOut: json['endGameLowerHubOut'],
      endGameTotalPoints: json['endGameTotalPoints'],
      endGameIsRobotHanging: json['endGameIsRobotHanging'],
      endGameHaveScoreBonus: json['endGameHaveScoreBonus'],
      endGameHaveHangerBonus: json['endGameHaveHangerBonus'],
      endGameTimeHanging: json['endGameTimeHanging'],
      endGameHangerIndexSelected: json['endGameHangerIndexSelected'],
      commentsAuto: json['commentsAuto'],
      commentsTeleOp: json['commentsTeleOp'],
      commentsEndGame: json['commentsEndGame'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'tournamentName': tournamentName,
        'scouterName': scouterName,
        'teamNumber': teamNumber,
        'gameNumber': gameNumber,
        'autoUpperHubIn': autoUpperHubIn,
        'autoLowerHubIn': autoLowerHubIn,
        'autoUpperHubOut': autoUpperHubOut,
        'autoLowerHubOut': autoLowerHubOut,
        'autoTotalPoints': autoTotalPoints,
        'autoMovesOffTarmac': autoMovesOffTarmac,
        'teleOpUpperHubIn': teleOpUpperHubIn,
        'teleOpLowerHubIn': teleOpLowerHubIn,
        'teleOpUpperHubOut': teleOpUpperHubOut,
        'teleOpLowerHubOut': teleOpLowerHubOut,
        'teleOpTotalPoints': teleOpTotalPoints,
        'endGameUpperHubIn': endGameUpperHubIn,
        'endGameLowerHubIn': endGameLowerHubIn,
        'endGameUpperHubOut': endGameUpperHubOut,
        'endGameLowerHubOut': endGameLowerHubOut,
        'endGameTotalPoints': endGameTotalPoints,
        'endGameIsRobotHanging': endGameIsRobotHanging,
        'endGameHaveScoreBonus': endGameHaveScoreBonus,
        'endGameHaveHangerBonus': endGameHaveHangerBonus,
        'endGameTimeHanging': endGameTimeHanging,
        'endGameHangerIndexSelected': endGameHangerIndexSelected,
        'commentsAuto': commentsAuto,
        'commentsTeleOp': commentsTeleOp,
        'commentsEndGame': commentsEndGame,
      };
}
