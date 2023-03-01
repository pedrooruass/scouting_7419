class DataModel {
  final String? id;

  final String? tournamentKey;
  final String? scouterName;
  final int teamNumber;
  final int matchNumber;
  final String? isAllianceBlue;

  // Autonomous
  final int autoTopRowCube;
  final int autoMiddleRowCube;
  final int autoBottomRowCube;
  final int autoTopRowCone;
  final int autoMiddleRowCone;
  final int autoBottomRowCone;
  final bool autoLeavesCommunity;
  final bool autoIsDocked;
  final bool autoIsEngaged;
  final int autoTotalPoints;

  // TeleOp
  final int teleOpTopRowCube;
  final int teleOpMiddleRowCube;
  final int teleOpBottomRowCube;
  final int teleOpTopRowCone;
  final int teleOpMiddleRowCone;
  final int teleOpBottomRowCone;
  final bool teleOpIsDocked;
  final bool teleOpIsEngaged;
  final int teleOpLinks;
  final bool teleOpIsRobotParked;
  final bool teleOpIsRobotDefensive;
  final int teleOpTotalPoints;

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
    required this.autoTopRowCube,
    required this.autoMiddleRowCube,
    required this.autoBottomRowCube,
    required this.autoTopRowCone,
    required this.autoMiddleRowCone,
    required this.autoBottomRowCone,
    required this.autoLeavesCommunity,
    required this.autoIsDocked,
    required this.autoIsEngaged,
    required this.autoTotalPoints,
    required this.teleOpTopRowCube,
    required this.teleOpMiddleRowCube,
    required this.teleOpBottomRowCube,
    required this.teleOpTopRowCone,
    required this.teleOpMiddleRowCone,
    required this.teleOpBottomRowCone,
    required this.teleOpIsDocked,
    required this.teleOpIsEngaged,
    required this.teleOpLinks,
    required this.teleOpIsRobotParked,
    required this.teleOpIsRobotDefensive,
    required this.teleOpTotalPoints,
    required this.isWinner,
    required this.commentsAuto,
    required this.commentsTeleOp,
    required this.commentsEndGame,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        tournamentKey: json["tournamentKey"] ?? "",
        scouterName: json["scouterName"] ?? "",
        teamNumber: json["teamNumber"],
        matchNumber: json["matchNumber"],
        isAllianceBlue: json["isAllianceBlue"] ?? "",
        autoTopRowCube: json["autoTopRowCube"],
        autoMiddleRowCube: json["autoMiddleRowCube"],
        autoBottomRowCube: json["autoBottomRowCube"],
        autoTopRowCone: json["autoTopRowCone"],
        autoMiddleRowCone: json["autoMiddleRowCone"],
        autoBottomRowCone: json["autoBottomRowCone"],
        autoLeavesCommunity: json["autoLeavesCommunity"],
        autoIsDocked: json["autoIsDocked"],
        autoIsEngaged: json["autoIsEngaged"],
        autoTotalPoints: json["autoTotalPoints"],
        teleOpTopRowCube: json["teleOpTopRowCube"],
        teleOpMiddleRowCube: json["teleOpMiddleRowCube"],
        teleOpBottomRowCube: json["teleOpBottomRowCube"],
        teleOpTopRowCone: json["teleOpTopRowCone"],
        teleOpMiddleRowCone: json["teleOpMiddleRowCone"],
        teleOpBottomRowCone: json["teleOpBottomRowCone"],
        teleOpIsDocked: json["teleOpIsDocked"],
        teleOpIsEngaged: json["teleOpIsEngaged"],
        teleOpLinks: json["teleOpLinks"],
        teleOpIsRobotParked: json["teleOpIsRobotParked"],
        teleOpIsRobotDefensive: json["teleOpIsRobotDefensive"],
        teleOpTotalPoints: json["teleOpTotalPoints"],
        isWinner: json["isWinner"],
        commentsAuto: json["commentsAuto"] ?? "",
        commentsTeleOp: json["commentsTeleOp"] ?? "",
        commentsEndGame: json["commentsEndGame"] ?? "",
      );
}
