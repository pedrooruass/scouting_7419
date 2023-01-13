import 'package:flutter/cupertino.dart';
import 'package:scoring_7419/application/models/game_model.dart';

class GameProvider extends ChangeNotifier {
  GameModel gameModel = GameModel();

  //Basic Info
  void changeAllianceColor() {
    gameModel.isAllianceBlue = !gameModel.isAllianceBlue;
    notifyListeners();
  }

  void changeMatchNumber(String matchNumber) {
    gameModel.matchNumber = int.parse(matchNumber);
    notifyListeners();
  }

  //Autonomous
  void autoIncreaseTopRowIn() {
    gameModel.autoTopRowIn++;
    notifyListeners();
  }

  void autoDecreaseTopRowIn() {
    if (gameModel.autoTopRowIn > 0) {
      gameModel.autoTopRowIn--;
      notifyListeners();
    }
  }

  void autoIncreaseMiddleRowIn() {
    gameModel.autoMiddleRowIn++;
    notifyListeners();
  }

  void autoDecreaseMiddleRowIn() {
    if (gameModel.autoMiddleRowIn > 0) {
      gameModel.autoMiddleRowIn--;
      notifyListeners();
    }
  }

  void autoIncreaseBottomRowIn() {
    gameModel.autoBottomRowIn++;
    notifyListeners();
  }

  void autoDecreaseBottomRowIn() {
    if (gameModel.autoBottomRowIn > 0) {
      gameModel.autoBottomRowIn--;
      notifyListeners();
    }
  }

  void autoIncreaseTopRowOut() {
    gameModel.autoTopRowOut++;
    notifyListeners();
  }

  void autoDecreaseTopRowOut() {
    if (gameModel.autoTopRowOut > 0) {
      gameModel.autoTopRowOut--;
      notifyListeners();
    }
  }

  void autoIncreaseMiddleRowOut() {
    gameModel.autoMiddleRowOut++;
    notifyListeners();
  }

  void autoDecreaseMiddleRowOut() {
    if (gameModel.autoMiddleRowOut > 0) {
      gameModel.autoMiddleRowOut--;
      notifyListeners();
    }
  }

  void autoIncreaseBottomRowOut() {
    gameModel.autoBottomRowOut++;
    notifyListeners();
  }

  void autoDecreaseBottomRowOut() {
    if (gameModel.autoBottomRowOut > 0) {
      gameModel.autoBottomRowOut--;
      notifyListeners();
    }
  }

  void autoToggleLeavesCommunity() {
    gameModel.autoLeavesCommunity = !gameModel.autoLeavesCommunity;
    notifyListeners();
  }

  void autoToggleDocked() {
    gameModel.autoIsDocked = !gameModel.autoIsDocked;
    notifyListeners();
  }

  void autoToggleEngaged() {
    gameModel.autoIsEngaged = !gameModel.autoIsEngaged;
    notifyListeners();
  }

  //TODO the time hold

  int calcAutoTopRow() => gameModel.autoTopRowIn * 6;

  int calcAutoMiddleRow() => gameModel.autoMiddleRowIn * 4;

  int calcAutoBottomRow() => gameModel.autoBottomRowIn * 2;

  int calcAutoLeavesCommunity() => gameModel.autoLeavesCommunity ? 3 : 0;

  int calcAutoIsDocked() => gameModel.autoIsDocked ? 5 : 0;

  int calcAutoIsEngaged() => gameModel.autoIsEngaged ? 5 : 0;

  int calcAutoTotal() {
    gameModel.autoTotalPoints = calcAutoTopRow() + calcAutoMiddleRow() + calcAutoBottomRow() + calcAutoLeavesCommunity() + calcAutoIsDocked() + calcAutoIsEngaged();
    return gameModel.autoTotalPoints;
  }

  //TeleOp
  void teleOpIncreaseTopRowIn() {
    gameModel.teleOpTopRowIn++;
    notifyListeners();
  }

  void teleOpDecreaseTopRowIn() {
    if (gameModel.teleOpTopRowIn > 0) {
      gameModel.teleOpTopRowIn--;
      notifyListeners();
    }
  }

  void teleOpIncreaseMiddleRowIn() {
    gameModel.teleOpMiddleRowIn++;
    notifyListeners();
  }

  void teleOpDecreaseMiddleRowIn() {
    if (gameModel.teleOpMiddleRowIn > 0) {
      gameModel.teleOpMiddleRowIn--;
      notifyListeners();
    }
  }

  void teleOpIncreaseBottomRowIn() {
    gameModel.teleOpBottomRowIn++;
    notifyListeners();
  }

  void teleOpDecreaseBottomRowIn() {
    if (gameModel.teleOpBottomRowIn > 0) {
      gameModel.teleOpBottomRowIn--;
      notifyListeners();
    }
  }

  void teleOpIncreaseTopRowOut() {
    gameModel.teleOpTopRowOut++;
    notifyListeners();
  }

  void teleOpDecreaseTopRowOut() {
    if (gameModel.teleOpTopRowOut > 0) {
      gameModel.teleOpTopRowOut--;
      notifyListeners();
    }
  }

  void teleOpIncreaseBottomRowOut() {
    gameModel.teleOpBottomRowOut++;
    notifyListeners();
  }

  void teleOpDecreaseMiddleRowOut() {
    if (gameModel.teleOpMiddleRowOut > 0) {
      gameModel.teleOpMiddleRowOut--;
      notifyListeners();
    }
  }

  void teleOpIncreaseMiddleRowOut() {
    gameModel.teleOpMiddleRowOut++;
    notifyListeners();
  }

  void teleOpDecreaseBottomRowOut() {
    if (gameModel.teleOpBottomRowOut > 0) {
      gameModel.teleOpBottomRowOut--;
      notifyListeners();
    }
  }

  void teleOpIncreaseLinks() {
    gameModel.teleOpLinks++;
    notifyListeners();
  }

  void teleOpDecreaseLinks() {
    if (gameModel.teleOpLinks > 0) {
      gameModel.teleOpLinks--;
      notifyListeners();
    }
  }

  void teleOpToggleIsDocked(bool value) {
    gameModel.teleOpIsDocked = value;
    notifyListeners();
  }

  void teleOpToggleIsEngaged(bool value) {
    gameModel.teleOpIsEngaged = value;
    notifyListeners();
  }

  void teleOpToggleIsRobotParked(bool value) {
    gameModel.teleOpIsRobotParked = value;
    notifyListeners();
  }

  void teleOpToggleIsRobotDefensive(bool value) {
    gameModel.teleOpIsRobotDefensive = value;
    notifyListeners();
  }

  int calcTopRow() => gameModel.teleOpTopRowIn * 5;

  int calcMiddleRow() => gameModel.teleOpMiddleRowIn * 3;

  int calcBottomRow() => gameModel.teleOpBottomRowIn * 2;

  int calcLinks() => gameModel.teleOpLinks * 2;

  int calcTeleOpIsDocked() => gameModel.teleOpIsDocked ? 5 : 0;

  int calcTeleOpIsEngaged() => gameModel.teleOpIsEngaged ? 5 : 0;

  int calcTeleOpIsRobotParked() => gameModel.teleOpIsRobotParked ? 5 : 0;

  int calcTeleOpTotalPoints() {
    gameModel.teleOpTotalPoints = calcTopRow() + calcMiddleRow() + calcBottomRow() + calcLinks() + calcTeleOpIsDocked() + calcTeleOpIsEngaged() + calcTeleOpIsRobotParked();
    return gameModel.teleOpTotalPoints;
  }

  void isWinnerToggle() {
    gameModel.isWinner = !gameModel.isWinner;
    notifyListeners();
  }

  void reset() {
    gameModel.isAllianceBlue = true;
    gameModel.matchNumber = 0;

    gameModel.autoTopRowIn = 0;
    gameModel.autoMiddleRowIn = 0;
    gameModel.autoBottomRowIn = 0;
    gameModel.autoTopRowOut = 0;
    gameModel.autoMiddleRowOut = 0;
    gameModel.autoBottomRowOut = 0;
    gameModel.autoLeavesCommunity = false;
    gameModel.autoIsDocked = false;
    gameModel.autoIsEngaged = false;
    gameModel.autoTotalPoints = 0;
    // the time

    gameModel.teleOpTopRowIn = 0;
    gameModel.teleOpMiddleRowIn = 0;
    gameModel.teleOpBottomRowIn = 0;
    gameModel.teleOpTopRowOut = 0;
    gameModel.teleOpMiddleRowOut = 0;
    gameModel.teleOpBottomRowOut = 0;
    gameModel.teleOpLinks = 0;
    gameModel.teleOpIsDocked = false;
    gameModel.teleOpIsEngaged = false;
    gameModel.teleOpIsRobotParked = false;
    gameModel.teleOpIsRobotDefensive = false;
    gameModel.teleOpTotalPoints = 0;

    gameModel.isWinner = false;
    gameModel.commentsAutoController.text = "";
    gameModel.commentsTeleOpController.text = "";
    gameModel.commentsEndGameController.text = "";

    notifyListeners();
  }
}
