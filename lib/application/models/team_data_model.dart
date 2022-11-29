class TeamDataModel {
  //Generic Info
  final int autoTotalPoints;
  final int teleOpTotalPoints;
  final int endGameTotalPoints;

  //Specific Info
  //Auto
  final int autoUpperHubIn; // Green and Red Line
  final int autoLowerHubIn;
  final int autoUpperHubOut;
  final int autoLowerHubOut;
  final bool autoMovesOffTarmac;

  //TeleOP
  final int teleOpUpperHubIn;
  final int teleOpLowerHubIn;
  final int teleOpUpperHubOut;
  final int teleOpLowerHubOut;
  final bool teleOpIsRobotDefensive;

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

  //Defensive Info
  final bool isDefensive;

  TeamDataModel({
    required this.autoTotalPoints,
    required this.teleOpTotalPoints,
    required this.endGameTotalPoints,
    required this.autoUpperHubIn,
    required this.autoLowerHubIn,
    required this.autoUpperHubOut,
    required this.autoLowerHubOut,
    required this.autoMovesOffTarmac,
    required this.teleOpUpperHubIn,
    required this.teleOpLowerHubIn,
    required this.teleOpUpperHubOut,
    required this.teleOpLowerHubOut,
    required this.teleOpIsRobotDefensive,
    required this.endGameUpperHubIn,
    required this.endGameLowerHubIn,
    required this.endGameUpperHubOut,
    required this.endGameLowerHubOut,
    required this.endGameIsRobotHanging,
    required this.endGameHaveScoreBonus,
    required this.endGameHaveHangerBonus,
    required this.endGameTimeHanging,
    required this.endGameHangerIndexSelected,
    required this.isDefensive,
  });

  factory TeamDataModel.fromJson(Map<String, dynamic> json){
    return TeamDataModel(
      autoTotalPoints: json['autoTotalPoints'],
      teleOpTotalPoints: json['teleOpTotalPoints'],
      endGameTotalPoints: json['endGameTotalPoints'],
      autoUpperHubIn: json['autoUpperHubIn'],
      autoLowerHubIn: json['autoLowerHubIn'],
      autoUpperHubOut: json['autoUpperHubOut'],
      autoLowerHubOut: json['autoLowerHubOut'],
      autoMovesOffTarmac: json['autoMovesOffTarmac'],
      teleOpUpperHubIn: json['teleOpUpperHubIn'],
      teleOpLowerHubIn: json['teleOpLowerHubIn'],
      teleOpUpperHubOut: json['teleOpUpperHubOut'],
      teleOpLowerHubOut: json['teleOpLowerHubOut'],
      teleOpIsRobotDefensive: json['teleOpIsRobotDefensive'],
      endGameUpperHubIn: json['endGameUpperHubIn'],
      endGameLowerHubIn: json['endGameLowerHubIn'],
      endGameUpperHubOut: json['endGameUpperHubOut'],
      endGameLowerHubOut: json['endGameLowerHubOut'],
      endGameIsRobotHanging: json['endGameIsRobotHanging'],
      endGameHaveScoreBonus: json['endGameHaveScoreBonus'],
      endGameHaveHangerBonus: json['endGameHaveHangerBonus'],
      endGameTimeHanging: json['endGameTimeHanging'],
      endGameHangerIndexSelected: json['endGameHangerIndexSelected'],
      isDefensive: json['isDefensive'],
    );
  }
}
