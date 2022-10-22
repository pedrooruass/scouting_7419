import 'package:flutter/cupertino.dart';

class EndGameProvider extends ChangeNotifier {
  int endGameUpperHubIn = 0;
  int endGameLowerHubIn = 0;
  int endGameUpperHubOut = 0;
  int endGameLowerHubOut = 0;
  int totalPoints = 0;
  bool isRobotHanging = false;
  bool haveScoreBonus = false;
  bool haveHangerBonus = false;
  int timeHanging = 0;
  int hangerIndexSelected = 0;

  void increaseUpperHubIn() {
    endGameUpperHubIn++;
    notifyListeners();
  }

  void decreaseUpperHubIn() {
    if (endGameUpperHubIn > 0) {
      endGameUpperHubIn--;
      notifyListeners();
    }
  }

  void increaseLowerHubIn() {
    endGameLowerHubIn++;
    notifyListeners();
  }

  void decreaseLowerHubIn() {
    if (endGameLowerHubIn > 0) {
      endGameLowerHubIn--;
      notifyListeners();
    }
  }

  void increaseLowerHubOut() {
    endGameLowerHubOut++;
    notifyListeners();
  }

  void decreaseLowerHubOut() {
    if (endGameLowerHubOut > 0) {
      endGameLowerHubOut--;
      notifyListeners();
    }
  }

  void increaseUpperHubOut() {
    endGameUpperHubOut++;
    notifyListeners();
  }

  void decreaseUpperHubOut() {
    if (endGameUpperHubOut > 0) {
      endGameUpperHubOut--;
      notifyListeners();
    }
  }

  void checkIsRobotHanging(bool value) {
    isRobotHanging = value;
    notifyListeners();
  }

  void checkHaveScoreBonus(bool value) {
    haveScoreBonus = value;
    notifyListeners();
  }

  void checkHaveHangerBonus(bool value) {
    haveHangerBonus = value;
    notifyListeners();
  }

  void increaseTimeHanging() {
    if (timeHanging < 30) {
      timeHanging++;
      notifyListeners();
    }
  }
 //TODO dont forget to get the maximuns
  void decreaseTimeHanging() {
    if (timeHanging > 0) {
      timeHanging--;
      notifyListeners();
    }
  }

  void changeHangerIndexSelected(int index) {
    hangerIndexSelected = index;
    notifyListeners();
  }

  int calcUpperHub() => endGameUpperHubIn * 2;
  int calcLowerHub() => endGameLowerHubIn * 1; 
  int calcHanging() {
    if (isRobotHanging) {
      if (hangerIndexSelected == 0) {
        return 4;
      } else if (hangerIndexSelected == 1) {
        return 6;
      } else if (hangerIndexSelected == 2) {
        return 10;
      } else if (hangerIndexSelected == 3 || hangerIndexSelected == 4) {
        return 15;
      }
    }
    return 0;
  }

  int calcScoreBonus() => haveScoreBonus ? 1 : 0;
  int calcHangerBonus() => haveHangerBonus ? 1 : 0; 
  int calcTotal() =>
      calcUpperHub() +
      calcLowerHub() +
      calcHanging() +
      calcScoreBonus() +
      calcHangerBonus();

  void resetPoints() {
    endGameUpperHubIn = 0;
    endGameLowerHubIn = 0;
    endGameUpperHubOut = 0;
    endGameLowerHubOut = 0;
    totalPoints = 0;
    isRobotHanging = false;
    haveScoreBonus = false;
    haveHangerBonus = false;
    timeHanging = 0;
    hangerIndexSelected = 0;
    notifyListeners();
  }
}
