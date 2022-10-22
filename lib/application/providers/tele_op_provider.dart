import 'package:flutter/cupertino.dart';

class TeleOpProvider extends ChangeNotifier {
  int teleOpUpperHubIn = 0;
  int teleOpLowerHubIn = 0;
  int teleOpUpperHubOut = 0;
  int teleOpLowerHubOut = 0;
  int totalPoints = 0;

void increaseUpperHubIn() {
    teleOpUpperHubIn++;
    notifyListeners();
  }

  void decreaseUpperHubIn() {
    if (teleOpUpperHubIn > 0) {
      teleOpUpperHubIn--;
      notifyListeners();
    }
  }

  void increaseLowerHubIn() {
    teleOpLowerHubIn++;
    notifyListeners();
  }

  void decreaseLowerHubIn() {
    if (teleOpLowerHubIn > 0) {
      teleOpLowerHubIn--;
      notifyListeners();
    }
  }

  void increaseLowerHubOut() {
    teleOpLowerHubOut++;
    notifyListeners();
  }

  void decreaseLowerHubOut() {
    if (teleOpLowerHubOut > 0) {
      teleOpLowerHubOut--;
      notifyListeners();
    }
  }

  void increaseUpperHubOut() {
    teleOpUpperHubOut++;
    notifyListeners();
  }

  void decreaseUpperHubOut() {
    if (teleOpUpperHubOut > 0) {
      teleOpUpperHubOut--;
      notifyListeners();
    }
  }


  int calcUpperHub() => teleOpUpperHubIn * 2;
  int calcLowerHub() => teleOpLowerHubIn * 1; 
  int calcTotal() => calcUpperHub() + calcLowerHub();

  void resetPoints(){
    teleOpUpperHubIn = 0;
    teleOpLowerHubIn = 0;
    teleOpUpperHubOut = 0;
    teleOpLowerHubOut = 0;
    notifyListeners();
  }
}