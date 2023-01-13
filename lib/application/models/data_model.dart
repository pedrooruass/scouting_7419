class DataModel {
  final String? id;

  final String? tournamentKey;
  final String? scouterName;
  final int teamNumber;
  final int matchNumber;
  final String? isAllianceBlue;

  // Autonomous
  final int autoTopRowIn;
  final int autoMiddleRowIn;
  final int autoBottomRowIn;

  final int autoTopRowOut;

  final int autoMiddleRowOut;
  final int autoBottomRowOut;
  final bool autoLeavesCommunity;
  final bool autoIsDocked;

  final bool autoIsEngaged;

  final int autoTotalPoints;

  final double autoTimeToDock;

  // TeleOp
  final int teleOpTopRowIn;
  final int teleOpMiddleRowIn;
  final int teleOpBottomRowIn;
  final int teleOpTopRowOut;
  final int teleOpMiddleRowOut;
  final int teleOpBottomRowOut;
  final bool teleOpIsDocked;
  final bool teleOpIsEngaged;
  final double teleOpTimeToDock;
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
    required this.autoTopRowIn,
    required this.autoMiddleRowIn,
    required this.autoBottomRowIn,
    required this.autoTopRowOut,
    required this.autoMiddleRowOut,
    required this.autoBottomRowOut,
    required this.autoLeavesCommunity,
    required this.autoIsDocked,
    required this.autoIsEngaged,
    required this.autoTotalPoints,
    required this.autoTimeToDock,
    required this.teleOpTopRowIn,
    required this.teleOpMiddleRowIn,
    required this.teleOpBottomRowIn,
    required this.teleOpTopRowOut,
    required this.teleOpMiddleRowOut,
    required this.teleOpBottomRowOut,
    required this.teleOpIsDocked,
    required this.teleOpIsEngaged,
    required this.teleOpTimeToDock,
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
        autoTopRowIn: json["autoTopRowIn"],
        autoMiddleRowIn: json["autoMiddleRowIn"],
        autoBottomRowIn: json["autoBottomRowIn"],
        autoTopRowOut: json["autoTopRowOut"],
        autoMiddleRowOut: json["autoMiddleRowOut"],
        autoBottomRowOut: json["autoBottomRowOut"],
        autoLeavesCommunity: json["autoLeavesCommunity"],
        autoIsDocked: json["autoIsDocked"],
        autoIsEngaged: json["autoIsEngaged"],
        autoTotalPoints: json["autoTotalPoints"],
        autoTimeToDock: json["autoTimeToDock"],
        teleOpTopRowIn: json["teleOpTopRowIn"],
        teleOpMiddleRowIn: json["teleOpMiddleRowIn"],
        teleOpBottomRowIn: json["teleOpBottomRowIn"],
        teleOpTopRowOut: json["teleOpTopRowOut"],
        teleOpMiddleRowOut: json["teleOpMiddleRowOut"],
        teleOpBottomRowOut: json["teleOpBottomRowOut"],
        teleOpIsDocked: json["teleOpIsDocked"],
        teleOpIsEngaged: json["teleOpIsEngaged"],
        teleOpTimeToDock: json["teleOpTimeToDock"],
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
