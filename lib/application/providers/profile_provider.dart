import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String profileImageAsset1 = "assets/images/option1.png";
  String profileImageAsset2 = "assets/images/option2.png";
  String profileImageAsset3 = "assets/images/option3.png";
  String profileImageAsset4 = "assets/images/option4.png";
  String profileImageChoice = "assets/images/option1.png";
  int profileImageChoiceId = 1;
  String? userName = FirebaseAuth.instance.currentUser!.email!
      .substring(0, FirebaseAuth.instance.currentUser!.email!.indexOf('@'));

  void changeProfileImage(int id) {
    if (id == 1) {
      profileImageChoice = profileImageAsset1;
      profileImageChoiceId = id;
    } else if (id == 2) {
      profileImageChoice = profileImageAsset2;
      profileImageChoiceId = id;
    } else if (id == 3) {
      profileImageChoice = profileImageAsset3;
      profileImageChoiceId = id;
    } else if (id == 4) {
      profileImageChoice = profileImageAsset4;
      profileImageChoiceId = id;
    }
    notifyListeners();
  }

  String getCurrentProfileImage() {
    if (profileImageChoiceId == 1) {
      profileImageChoice = "assets/images/option1.png";
    } else if (profileImageChoiceId == 2) {
      profileImageChoice = "assets/images/option2.png";
    } else if (profileImageChoiceId == 3) {
      profileImageChoice = "assets/images/option3.png";
    } else if (profileImageChoiceId == 4) {
      profileImageChoice = "assets/images/option4.png";
    }
    notifyListeners();
    return profileImageChoice;
  }

  String getCurrentUserName() {
    userName = FirebaseAuth.instance.currentUser!.email!
        .substring(0, FirebaseAuth.instance.currentUser!.email!.indexOf('@'));
    notifyListeners();
    return userName!;
  }

  void resetProfile() {
    userName = null;
    profileImageChoice = "assets/images/option1.png";
  }
}
