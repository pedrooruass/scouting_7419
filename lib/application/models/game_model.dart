import 'package:flutter/material.dart';

class GameModel {
  //Basic Info
  int matchNumber = 0;
  bool isAllianceBlue = true;

  // Autonomous
  int autoTopRowIn = 0;
  int autoMiddleRowIn = 0;
  int autoBottomRowIn = 0;
  int autoTopRowOut = 0;
  int autoMiddleRowOut = 0;
  int autoBottomRowOut = 0;
  bool autoLeavesCommunity = false;
  bool autoIsDocked = false;
  bool autoIsEngaged = false;
  int autoTotalPoints = 0;
  double autoTimeToDock = 0.0;

  // TeleOp
  int teleOpTopRowIn = 0;
  int teleOpMiddleRowIn = 0;
  int teleOpBottomRowIn = 0;
  int teleOpTopRowOut = 0;
  int teleOpMiddleRowOut = 0;
  int teleOpBottomRowOut = 0;
  bool teleOpIsDocked = false;
  bool teleOpIsEngaged = false;
  double teleOpTimeToDock = 0.0;
  int teleOpLinks = 0;
  bool teleOpIsRobotParked = false;
  bool teleOpIsRobotDefensive = false;
  int teleOpTotalPoints = 0;

  //Extra && Comments
  bool isWinner = false;
  TextEditingController commentsAutoController = TextEditingController();
  TextEditingController commentsTeleOpController = TextEditingController();
  TextEditingController commentsEndGameController = TextEditingController();
}
