import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/data_model.dart';

class DataProvider extends ChangeNotifier {
  // Map<String, DataModel> teamDatas = {};
  List<DataModel> ld = [];
  int teamWins = 0;
  int teamLoss = 0;
  double averageAutonomousPoints = 0;
  double averageTeleOpPoints = 0;

  // Use a for each and put this on the teams page, by doing this i will have all the data before with all the teams and i will be able to distribute and manipulate the lists however i want
  getTeamDataInTournament({required int teamNumber, required String tournamentKey}) {
    ld = [];
    teamWins = 0;
    teamLoss = 0;
    averageAutonomousPoints = 0;
    averageTeleOpPoints = 0;
    FirebaseFirestore.instance.collection('scoring').where("tournamentKey", isEqualTo: tournamentKey).where("teamNumber", isEqualTo: teamNumber).get().then((snapshot) => snapshot.docs.forEach((doc) {
          print(doc.id);
          ld += [DataModel.fromJson(doc.data())];
          _calculateTeamWins();
          _calculateAverageAutonomousPoints();
          _calculateAverageTeleOpPoints();
          notifyListeners();
        }));
  }

  _calculateTeamWins() {
    teamWins = 0;
    teamLoss = 0;
    for (int i = 0; i < ld.length; i++) {
      if (ld[i].isWinner) {
        teamWins++;
      } else {
        teamLoss++;
      }
    }
  }

  _calculateAverageAutonomousPoints() {
    averageAutonomousPoints = 0;
    for (int i = 0; i < ld.length; i++) {
      averageAutonomousPoints += ld[i].autoTotalPoints;
    }
    averageAutonomousPoints = averageAutonomousPoints / ld.length;
  }

  _calculateAverageTeleOpPoints() {
    averageTeleOpPoints = 0;
    for (int i = 0; i < ld.length; i++) {
      averageTeleOpPoints += ld[i].teleOpTotalPoints;
    }
    averageTeleOpPoints = averageTeleOpPoints / ld.length;
  }

//  Charts usage
  int chartIndexSelected = 0;
  List<String> chartTitles = ["Autonomous", "TeleOp"];

  void changeChartIndex(int index) {
    chartIndexSelected = index;
    notifyListeners();
  }

  getGeneralTournamentData() {
    ld = [];
    FirebaseFirestore.instance.collection('scoring').get().then((snapshot) => snapshot.docs.forEach((doc) {
          print(doc.id);
          ld += [DataModel.fromJson(doc.data())];
          _calculateTeamWins();
          _calculateAverageAutonomousPoints();
          _calculateAverageTeleOpPoints();
          // _calculateTop8TeamsInTournament();
          notifyListeners();
        }));
  }

  //Count the amount of time the teams have won and lost
  _calculateTeamWinLossRatioInTournament() {
    return teamWins + teamLoss / ld.length; //TODO is this the way to calculate the team win loss ratio
  }
}
