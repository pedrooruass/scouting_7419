// class ScoringModel {
//   final String id;
//
//   final String tournamentKey;
//   final String scouterName;
//   final int teamNumber;
//   final int matchNumber;
//   final bool isAllianceBlue;
//
//   // Autonomous
//   final int autoUpperHubIn;
//   final int autoLowerHubIn;
//   final int autoUpperHubOut;
//   final int autoLowerHubOut;
//   final bool autoMovesOffTarmac;
//   final int autoTotalPoints;
//
//   // TeleOp
//   final int teleOpUpperHubIn;
//   final int teleOpLowerHubIn;
//   final int teleOpUpperHubOut;
//   final int teleOpLowerHubOut;
//   final bool teleOpIsRobotDefensive;
//   final int teleOpTotalPoints;
//
//   // End Game
//   final int endGameUpperHubIn;
//   final int endGameLowerHubIn;
//   final int endGameUpperHubOut;
//   final int endGameLowerHubOut;
//   final bool endGameIsRobotHanging;
//   final bool endGameHaveScoreBonus;
//   final bool endGameHaveHangerBonus;
//   final int endGameTimeHanging;
//   final int endGameHangerIndexSelected;
//   final int endGameTotalPoints;
//
//   final bool isWinner;
//   final String commentsAuto;
//   final String commentsTeleOp;
//   final String commentsEndGame;
//
//   //Comments
//   ScoringModel({
//     required this.id,
//     required this.tournamentKey,
//     required this.scouterName,
//     required this.teamNumber,
//     required this.matchNumber,
//     required this.isAllianceBlue,
//     required this.autoUpperHubIn,
//     required this.autoLowerHubIn,
//     required this.autoUpperHubOut,
//     required this.autoLowerHubOut,
//     required this.autoMovesOffTarmac,
//     required this.autoTotalPoints,
//     required this.teleOpUpperHubIn,
//     required this.teleOpLowerHubIn,
//     required this.teleOpUpperHubOut,
//     required this.teleOpLowerHubOut,
//     required this.teleOpIsRobotDefensive,
//     required this.teleOpTotalPoints,
//     required this.endGameUpperHubIn,
//     required this.endGameLowerHubIn,
//     required this.endGameUpperHubOut,
//     required this.endGameLowerHubOut,
//     required this.endGameTotalPoints,
//     required this.endGameIsRobotHanging,
//     required this.endGameHaveScoreBonus,
//     required this.endGameHaveHangerBonus,
//     required this.endGameTimeHanging,
//     required this.endGameHangerIndexSelected,
//     required this.isWinner,
//     required this.commentsAuto,
//     required this.commentsTeleOp,
//     required this.commentsEndGame,
//   });
//
//   factory ScoringModel.fromJson(Map<String, dynamic> json) {
//     return ScoringModel(
//       id: json['id'],
//       tournamentKey: json['tournamentKey'],
//       scouterName: json['scouterName'],
//       teamNumber: json['teamNumber'],
//       matchNumber: json['matchNumber'],
//       isAllianceBlue: json['isAllianceBlue'],
//       autoUpperHubIn: json['autoUpperHubIn'],
//       autoLowerHubIn: json['autoLowerHubIn'],
//       autoUpperHubOut: json['autoUpperHubOut'],
//       autoLowerHubOut: json['autoLowerHubOut'],
//       autoTotalPoints: json['autoTotalPoints'],
//       autoMovesOffTarmac: json['autoMovesOffTarmac'],
//       teleOpUpperHubIn: json['teleOpUpperHubIn'],
//       teleOpLowerHubIn: json['teleOpLowerHubIn'],
//       teleOpUpperHubOut: json['teleOpUpperHubOut'],
//       teleOpLowerHubOut: json['teleOpLowerHubOut'],
//       teleOpIsRobotDefensive: json["teleOpIsRobotDefensive"],
//       teleOpTotalPoints: json['teleOpTotalPoints'],
//       endGameUpperHubIn: json['endGameUpperHubIn'],
//       endGameLowerHubIn: json['endGameLowerHubIn'],
//       endGameUpperHubOut: json['endGameUpperHubOut'],
//       endGameLowerHubOut: json['endGameLowerHubOut'],
//       endGameIsRobotHanging: json['endGameIsRobotHanging'],
//       endGameHaveScoreBonus: json['endGameHaveScoreBonus'],
//       endGameHaveHangerBonus: json['endGameHaveHangerBonus'],
//       endGameTimeHanging: json['endGameTimeHanging'],
//       endGameHangerIndexSelected: json['endGameHangerIndexSelected'],
//       endGameTotalPoints: json['endGameTotalPoints'],
//       isWinner: json['isWinner'],
//       commentsAuto: json['commentsAuto'],
//       commentsTeleOp: json['commentsTeleOp'],
//       commentsEndGame: json['commentsEndGame'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'tournamentKey': tournamentKey, //TODO change this later to tournament name
//     'scouterName': scouterName,
//     'teamNumber': teamNumber,
//     'matchNumber': matchNumber,
//     'isAllianceBlue': isAllianceBlue == true ? "Blue" : "Red",
//     'autoUpperHubIn': autoUpperHubIn,
//     'autoLowerHubIn': autoLowerHubIn,
//     'autoUpperHubOut': autoUpperHubOut,
//     'autoLowerHubOut': autoLowerHubOut,
//     'autoMovesOffTarmac': autoMovesOffTarmac,
//     'autoTotalPoints': autoTotalPoints,
//     'teleOpUpperHubIn': teleOpUpperHubIn,
//     'teleOpLowerHubIn': teleOpLowerHubIn,
//     'teleOpUpperHubOut': teleOpUpperHubOut,
//     'teleOpLowerHubOut': teleOpLowerHubOut,
//     'teleOpIsRobotDefensive': teleOpIsRobotDefensive,
//     'teleOpTotalPoints': teleOpTotalPoints,
//     'endGameUpperHubIn': endGameUpperHubIn,
//     'endGameLowerHubIn': endGameLowerHubIn,
//     'endGameUpperHubOut': endGameUpperHubOut,
//     'endGameLowerHubOut': endGameLowerHubOut,
//     'endGameIsRobotHanging': endGameIsRobotHanging,
//     'endGameHangerIndexSelected': endGameHangerIndexSelected,
//     'endGameHaveScoreBonus': endGameHaveScoreBonus,
//     'endGameHaveHangerBonus': endGameHaveHangerBonus,
//     'endGameTimeHanging': endGameTimeHanging,
//     'endGameTotalPoints': endGameTotalPoints,
//     'isWinner': isWinner,
//     'commentsAuto': commentsAuto,
//     'commentsTeleOp': commentsTeleOp,
//     'commentsEndGame': commentsEndGame,
//   };
// }
