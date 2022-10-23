class GameModel {
  // Autonomous
  int autoUpperHubIn = 0;
  int autoLowerHubIn = 0;
  int autoUpperHubOut = 0;
  int autoLowerHubOut = 0;
  bool autoMovesOffTarmac = false;
  int autoTotalPoints = 0;

  // TeleOp
  int teleOpUpperHubIn = 0;
  int teleOpLowerHubIn = 0;
  int teleOpUpperHubOut = 0;
  int teleOpLowerHubOut = 0;
  int teleOpTotalPoints = 0;

  // End Game
  int endGameUpperHubIn = 0;
  int endGameLowerHubIn = 0;
  int endGameUpperHubOut = 0;
  int endGameLowerHubOut = 0;
  int endGameTotalPoints = 0;
  bool endGameIsRobotHanging = false;
  bool endGameHaveScoreBonus = false;
  bool endGameHaveHangerBonus = false;
  int endGameTimeHanging = 0;
  int endGameHangerIndexSelected = 0;
}
