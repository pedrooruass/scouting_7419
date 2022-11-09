import 'package:flutter/cupertino.dart';
import 'package:scoring_7419/application/models/game_model.dart';

class GameProvider extends ChangeNotifier {
  GameModel gameModel = GameModel();

  //Autonomous
  void autoToggleTarmac() {
    gameModel.autoMovesOffTarmac = !gameModel.autoMovesOffTarmac;
    notifyListeners();
  }

  void autoIncreaseUpperHubIn() {
    gameModel.autoUpperHubIn++;
    notifyListeners();
  }

  void autoDecreaseUpperHubIn() {
    if (gameModel.autoUpperHubIn > 0) {
      gameModel.autoUpperHubIn--;
      notifyListeners();
    }
  }

  void autoIncreaseLowerHubIn() {
    gameModel.autoLowerHubIn++;
    notifyListeners();
  }

  void autoDecreaseLowerHubIn() {
    if (gameModel.autoLowerHubIn > 0) {
      gameModel.autoLowerHubIn--;
      notifyListeners();
    }
  }

  void autoIncreaseLowerHubOut() {
    gameModel.autoLowerHubOut++;
    notifyListeners();
  }

  void autoDecreaseLowerHubOut() {
    if (gameModel.autoLowerHubOut > 0) {
      gameModel.autoLowerHubOut--;
      notifyListeners();
    }
  }

  void autoIncreaseUpperHubOut() {
    gameModel.autoUpperHubOut++;
    notifyListeners();
  }

  void autoDecreaseUpperHubOut() {
    if (gameModel.autoUpperHubOut > 0) {
      gameModel.autoUpperHubOut--;
      notifyListeners();
    }
  }

  int calcAutoUpperHub() => gameModel.autoUpperHubIn * 4;

  int calcAutoLowerHub() => gameModel.autoLowerHubIn * 2;

  int calcAutoTarmac() => gameModel.autoMovesOffTarmac ? 2 : 0;

  int calcAutoTotal() =>
      calcAutoUpperHub() + calcAutoLowerHub() + calcAutoTarmac();

  //TeleOp
  void teleOpIncreaseUpperHubIn() {
    gameModel.teleOpUpperHubIn++;
    notifyListeners();
  }

  void teleOpDecreaseUpperHubIn() {
    if (gameModel.teleOpUpperHubIn > 0) {
      gameModel.teleOpUpperHubIn--;
      notifyListeners();
    }
  }

  void teleOpIncreaseLowerHubIn() {
    gameModel.teleOpLowerHubIn++;
    notifyListeners();
  }

  void teleOpDecreaseLowerHubIn() {
    if (gameModel.teleOpLowerHubIn > 0) {
      gameModel.teleOpLowerHubIn--;
      notifyListeners();
    }
  }

  void teleOpIncreaseLowerHubOut() {
    gameModel.teleOpLowerHubOut++;
    notifyListeners();
  }

  void teleOpDecreaseLowerHubOut() {
    if (gameModel.teleOpLowerHubOut > 0) {
      gameModel.teleOpLowerHubOut--;
      notifyListeners();
    }
  }

  void teleOpIncreaseUpperHubOut() {
    gameModel.teleOpUpperHubOut++;
    notifyListeners();
  }

  void teleOpDecreaseUpperHubOut() {
    if (gameModel.teleOpUpperHubOut > 0) {
      gameModel.teleOpUpperHubOut--;
      notifyListeners();
    }
  }

  void teleOpToggleIsRobotDefensive(bool value) {
    gameModel.teleOpIsRobotDefensive = value;
    notifyListeners();
  }

  int calcTeleOpUpperHub() => gameModel.teleOpUpperHubIn * 2;

  int calcTeleOpLowerHub() => gameModel.teleOpLowerHubIn * 1;

  int calcTeleOpTotal() => calcTeleOpUpperHub() + calcTeleOpLowerHub();

// End Game
  void endGameIncreaseUpperHubIn() {
    gameModel.endGameUpperHubIn++;
    notifyListeners();
  }

  void endGameDecreaseUpperHubIn() {
    if (gameModel.endGameUpperHubIn > 0) {
      gameModel.endGameUpperHubIn--;
      notifyListeners();
    }
  }

  void endGameIncreaseLowerHubIn() {
    gameModel.endGameLowerHubIn++;
    notifyListeners();
  }

  void endGameDecreaseLowerHubIn() {
    if (gameModel.endGameLowerHubIn > 0) {
      gameModel.endGameLowerHubIn--;
      notifyListeners();
    }
  }

  void endGameIncreaseLowerHubOut() {
    gameModel.endGameLowerHubOut++;
    notifyListeners();
  }

  void endGameDecreaseLowerHubOut() {
    if (gameModel.endGameLowerHubOut > 0) {
      gameModel.endGameLowerHubOut--;
      notifyListeners();
    }
  }

  void endGameIncreaseUpperHubOut() {
    gameModel.endGameUpperHubOut++;
    notifyListeners();
  }

  void endGameDecreaseUpperHubOut() {
    if (gameModel.endGameUpperHubOut > 0) {
      gameModel.endGameUpperHubOut--;
      notifyListeners();
    }
  }

  void endGameCheckIsRobotHanging(bool value) {
    gameModel.endGameIsRobotHanging = value;
    notifyListeners();
  }

  void endGameCheckHaveScoreBonus(bool value) {
    gameModel.endGameHaveScoreBonus = value;
    notifyListeners();
  }

  void endGameCheckHaveHangerBonus(bool value) {
    gameModel.endGameHaveHangerBonus = value;
    notifyListeners();
  }

  void endGameIncreaseTimeHanging() {
    if (gameModel.endGameTimeHanging < 30) {
      gameModel.endGameTimeHanging++;
      notifyListeners();
    }
  }

  void endGameDecreaseTimeHanging() {
    if (gameModel.endGameTimeHanging > 0) {
      gameModel.endGameTimeHanging--;
      notifyListeners();
    }
  }

  void endGameChangeHangerIndexSelected(int index) {
    gameModel.endGameHangerIndexSelected = index;
    notifyListeners();
  }

  int calcEndGameUpperHub() => gameModel.endGameUpperHubIn * 2;

  int calcEndGameLowerHub() => gameModel.endGameLowerHubIn * 1;

  int calcEndGameHanging() {
    if (gameModel.endGameIsRobotHanging) {
      if (gameModel.endGameHangerIndexSelected == 0) {
        return 4;
      } else if (gameModel.endGameHangerIndexSelected == 1) {
        return 6;
      } else if (gameModel.endGameHangerIndexSelected == 2) {
        return 10;
      } else if (gameModel.endGameHangerIndexSelected == 3 ||
          gameModel.endGameHangerIndexSelected == 4) {
        return 15;
      }
    }
    return 0;
  }

  int calcEndGameScoreBonus() => gameModel.endGameHaveScoreBonus ? 1 : 0;

  int calcEndGameHangerBonus() => gameModel.endGameHaveHangerBonus ? 1 : 0;

  int calcEndGameTotal() =>
      calcEndGameUpperHub() +
      calcEndGameLowerHub() +
      calcEndGameHanging() +
      calcEndGameScoreBonus() +
      calcEndGameHangerBonus();

  void reset() {
    gameModel.autoUpperHubIn = 0;
    gameModel.autoLowerHubIn = 0;
    gameModel.autoUpperHubOut = 0;
    gameModel.autoLowerHubOut = 0;
    gameModel.autoMovesOffTarmac = false;

    gameModel.teleOpUpperHubIn = 0;
    gameModel.teleOpLowerHubIn = 0;
    gameModel.teleOpUpperHubOut = 0;
    gameModel.teleOpLowerHubOut = 0;
    gameModel.teleOpIsRobotDefensive = false;

    gameModel.endGameUpperHubIn = 0;
    gameModel.endGameLowerHubIn = 0;
    gameModel.endGameUpperHubOut = 0;
    gameModel.endGameLowerHubOut = 0;
    gameModel.endGameIsRobotHanging = false;
    gameModel.endGameHaveScoreBonus = false;
    gameModel.endGameHaveHangerBonus = false;
    gameModel.endGameTimeHanging = 0;
    gameModel.endGameHangerIndexSelected = 0;
    gameModel.endGameTotalPoints = 0;

    gameModel.commentsAutoController.text = "";
    gameModel.commentsTeleOpController.text = "";
    gameModel.commentsEndGameController.text = "";

    notifyListeners();
  }
}
