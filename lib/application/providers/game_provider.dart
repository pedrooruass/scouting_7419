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
  void autoIncreaseTopRowCube() {
    gameModel.autoTopRowCube++;
    notifyListeners();
  }

  void autoDecreaseTopRowCube() {
    if (gameModel.autoTopRowCube > 0) {
      gameModel.autoTopRowCube--;
      notifyListeners();
    }
  }

  void autoIncreaseMiddleRowCube() {
    gameModel.autoMiddleRowCube++;
    notifyListeners();
  }

  void autoDecreaseMiddleRowCube() {
    if (gameModel.autoMiddleRowCube > 0) {
      gameModel.autoMiddleRowCube--;
      notifyListeners();
    }
  }

  void autoIncreaseBottomRowCube() {
    gameModel.autoBottomRowCub++;
    notifyListeners();
  }

  void autoDecreaseBottomRowCube() {
    if (gameModel.autoBottomRowCub > 0) {
      gameModel.autoBottomRowCub--;
      notifyListeners();
    }
  }

  void autoIncreaseTopRowCone() {
    gameModel.autoTopRowCone++;
    notifyListeners();
  }

  void autoDecreaseTopRowCone() {
    if (gameModel.autoTopRowCone > 0) {
      gameModel.autoTopRowCone--;
      notifyListeners();
    }
  }

  void autoIncreaseMiddleRowCone() {
    gameModel.autoMiddleRowCone++;
    notifyListeners();
  }

  void autoDecreaseMiddleRowCone() {
    if (gameModel.autoMiddleRowCone > 0) {
      gameModel.autoMiddleRowCone--;
      notifyListeners();
    }
  }

  void autoIncreaseBottomRowCone() {
    gameModel.autoBottomRowCone++;
    notifyListeners();
  }

  void autoDecreaseBottomRowCone() {
    if (gameModel.autoBottomRowCone > 0) {
      gameModel.autoBottomRowCone--;
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

  int calcAutoTopRow() => (gameModel.autoTopRowCube * 6) + (gameModel.autoTopRowCone * 6);

  int calcAutoMiddleRow() => (gameModel.autoMiddleRowCube * 4) + (gameModel.autoMiddleRowCone * 4);

  int calcAutoBottomRow() => (gameModel.autoBottomRowCub * 3) + (gameModel.autoBottomRowCone * 3);

  int calcAutoLeavesCommunity() => gameModel.autoLeavesCommunity ? 3 : 0;

  int calcAutoIsDocked() => gameModel.autoIsDocked ? 8 : 0;

  int calcAutoIsEngaged() => gameModel.autoIsEngaged ? 4 : 0;

  int calcAutoTotal() {
    gameModel.autoTotalPoints = calcAutoTopRow() + calcAutoMiddleRow() + calcAutoBottomRow() + calcAutoLeavesCommunity() + calcAutoIsDocked() + calcAutoIsEngaged();
    return gameModel.autoTotalPoints;
  }

  //TeleOp
  void teleOpIncreaseTopRowCube() {
    gameModel.teleOpTopRowCube++;
    notifyListeners();
  }

  void teleOpDecreaseTopRowCube() {
    if (gameModel.teleOpTopRowCube > 0) {
      gameModel.teleOpTopRowCube--;
      notifyListeners();
    }
  }

  void teleOpIncreaseMiddleRowCube() {
    gameModel.teleOpMiddleRowCube++;
    notifyListeners();
  }

  void teleOpDecreaseMiddleRowCube() {
    if (gameModel.teleOpMiddleRowCube > 0) {
      gameModel.teleOpMiddleRowCube--;
      notifyListeners();
    }
  }

  void teleOpIncreaseBottomRowCube() {
    gameModel.teleOpBottomRowCube++;
    notifyListeners();
  }

  void teleOpDecreaseBottomRowCube() {
    if (gameModel.teleOpBottomRowCube > 0) {
      gameModel.teleOpBottomRowCube--;
      notifyListeners();
    }
  }

  void teleOpIncreaseTopRowCone() {
    gameModel.teleOpTopRowCone++;
    notifyListeners();
  }

  void teleOpDecreaseTopRowCone() {
    if (gameModel.teleOpTopRowCone > 0) {
      gameModel.teleOpTopRowCone--;
      notifyListeners();
    }
  }

  void teleOpIncreaseBottomRowCone() {
    gameModel.teleOpBottomRowCone++;
    notifyListeners();
  }

  void teleOpDecreaseMiddleRowCone() {
    if (gameModel.teleOpMiddleRowCone > 0) {
      gameModel.teleOpMiddleRowCone--;
      notifyListeners();
    }
  }

  void teleOpIncreaseMiddleRowCone() {
    gameModel.teleOpMiddleRowCone++;
    notifyListeners();
  }

  void teleOpDecreaseBottomRowCone() {
    if (gameModel.teleOpBottomRowCone > 0) {
      gameModel.teleOpBottomRowCone--;
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

  int calcTeleOpTopRow() => (gameModel.teleOpTopRowCube * 5) + (gameModel.teleOpTopRowCone * 5);

  int calcTeleOpMiddleRow() => (gameModel.teleOpMiddleRowCube * 3) + (gameModel.teleOpMiddleRowCone * 3);

  int calcTeleOpBottomRow() => (gameModel.teleOpBottomRowCube * 2) + (gameModel.teleOpBottomRowCone * 2);

  int calcTeleOpLinks() => gameModel.teleOpLinks * 5;

  int calcTeleOpIsDocked() => gameModel.teleOpIsDocked ? 6 : 0;

  int calcTeleOpIsEngaged() => gameModel.teleOpIsEngaged ? 4 : 0;

  int calcTeleOpIsRobotParked() => gameModel.teleOpIsRobotParked ? 2 : 0;

  int calcTeleOpTotalPoints() {
    gameModel.teleOpTotalPoints = calcTeleOpTopRow() + calcTeleOpMiddleRow() + calcTeleOpBottomRow() + calcTeleOpLinks() + calcTeleOpIsDocked() + calcTeleOpIsEngaged() + calcTeleOpIsRobotParked();
    return gameModel.teleOpTotalPoints;
  }

  void isWinnerToggle() {
    gameModel.isWinner = !gameModel.isWinner;
    notifyListeners();
  }

  void reset() {
    gameModel.isAllianceBlue = true;
    gameModel.matchNumber = 0;

    gameModel.autoTopRowCube = 0;
    gameModel.autoMiddleRowCube = 0;
    gameModel.autoBottomRowCub = 0;
    gameModel.autoTopRowCone = 0;
    gameModel.autoMiddleRowCone = 0;
    gameModel.autoBottomRowCone = 0;
    gameModel.autoLeavesCommunity = false;
    gameModel.autoIsDocked = false;
    gameModel.autoIsEngaged = false;
    gameModel.autoTotalPoints = 0;
    // the time

    gameModel.teleOpTopRowCube = 0;
    gameModel.teleOpMiddleRowCube = 0;
    gameModel.teleOpBottomRowCube = 0;
    gameModel.teleOpTopRowCone = 0;
    gameModel.teleOpMiddleRowCone = 0;
    gameModel.teleOpBottomRowCone = 0;
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
