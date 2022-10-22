import 'package:flutter/material.dart';

class AutonomousProvider extends ChangeNotifier {
  // Autonomous
  int autoUpperHubIn = 0;
  int autoLowerHubIn = 0;
  int autoUpperHubOut = 0;
  int autoLowerHubOut = 0;
  int totalPoints = 0;
  bool autoMovesOffTarmac = false;

  void autoToggleTarmac() {
    autoMovesOffTarmac = !autoMovesOffTarmac;
    notifyListeners();
  }

  void increaseUpperHubIn() {
    autoUpperHubIn++;
    notifyListeners();
  }

  void decreaseUpperHubIn() {
    if (autoUpperHubIn > 0) {
      autoUpperHubIn--;
      notifyListeners();
    }
  }

  void increaseLowerHubIn() {
    autoLowerHubIn++;
    notifyListeners();
  }

  void decreaseLowerHubIn() {
    if (autoLowerHubIn > 0) {
      autoLowerHubIn--;
      notifyListeners();
    }
  }

  void increaseLowerHubOut() {
    autoLowerHubOut++;
    notifyListeners();
  }

  void decreaseLowerHubOut() {
    if (autoLowerHubOut > 0) {
      autoLowerHubOut--;
      notifyListeners();
    }
  }

  void increaseUpperHubOut() {
    autoUpperHubOut++;
    notifyListeners();
  }

  void decreaseUpperHubOut() {
    if (autoUpperHubOut > 0) {
      autoUpperHubOut--;
      notifyListeners();
    }
  }

  int calcAutoUpperHub() => autoUpperHubIn * 4; //TODO change values
  int calcAutoLowerHub() => autoLowerHubIn * 2; //TODO change values
  int calcAutoTarmac() => autoMovesOffTarmac ? 2 : 0; //TODO change values
  int calcTotal() => calcAutoUpperHub() + calcAutoLowerHub() + calcAutoTarmac();

  void resetAutoPoints() {
    autoUpperHubIn = 0;
    autoLowerHubIn = 0;
    autoMovesOffTarmac = false; 
    notifyListeners();
  }
}
