import 'package:flutter/material.dart';

class GameModel {
  //Basic Info
  int matchNumber = 0;
  bool isAllianceBlue = true;

  // Autonomous
  int autoTopRowCube = 0; //In = Cube
  int autoMiddleRowCube = 0;
  int autoBottomRowCub = 0;
  int autoTopRowCone = 0; //Out = Cone
  int autoMiddleRowCone = 0;
  int autoBottomRowCone = 0;
  bool autoLeavesCommunity = false;
  bool autoIsDocked = false;
  bool autoIsEngaged = false;
  int autoTotalPoints = 0;

  // TeleOp
  int teleOpTopRowCube = 0;
  int teleOpMiddleRowCube = 0;
  int teleOpBottomRowCube = 0;
  int teleOpTopRowCone = 0;
  int teleOpMiddleRowCone = 0;
  int teleOpBottomRowCone = 0;
  bool teleOpIsDocked = false;
  bool teleOpIsEngaged = false;
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
