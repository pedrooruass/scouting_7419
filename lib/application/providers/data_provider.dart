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
  int conesScored = 0;
  int cubeScored = 0;

  List<dynamic> ldWins = []; // Win loss ratio

  // Use a for each and put this on the teams page, by doing this i will have all the data before with all the teams and i will be able to distribute and manipulate the lists however i want
  getTeamDataInTournament({required int teamNumber, required String tournamentKey}) async {
    ld = [];
    teamWins = 0;
    teamLoss = 0;
    averageAutonomousPoints = 0;
    averageTeleOpPoints = 0;
    conesScored = 0;
    cubeScored = 0;
    await FirebaseFirestore.instance.collection('scoring').where("tournamentKey", isEqualTo: tournamentKey).where("teamNumber", isEqualTo: teamNumber).get().then((snapshot) => snapshot.docs.forEach((doc) {
          print(doc.id);
          ld += [DataModel.fromJson(doc.data())];
          _calculateTeamWins();
          _calculateAverageAutonomousPoints();
          _calculateAverageTeleOpPoints();
          _calculateMostCones();
          _calculateMostCubes();
          notifyListeners();
        }));
  }

  // getTheListForTeamWins(List<String> teamsInTournament, String tournamentKey) async {
  //   dynamic listOfResults = [];
  //   ldWins = [];
  //   //how to store the values?
  //   for (int i = 0; i < teamsInTournament.length; i++) {
  //     await getTeamDataInTournament(teamNumber: int.parse(teamsInTournament[i].substring(3, teamsInTournament[i].length)), tournamentKey: tournamentKey);
  //     listOfResults.add(teamsInTournament[i]); //just get the same index from the teamsStringList
  //     listOfResults.add(teamWins);
  //   }
  //   ldWins += listOfResults;
  //   notifyListeners();
  // }

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

  _calculateMostCones() {
    conesScored = 0;
    for (int i = 0; i < ld.length; i++) {
      conesScored += ld[i].autoTopRowCone + ld[i].autoMiddleRowCone + ld[i].autoMiddleRowCone + ld[i].teleOpTopRowCone + ld[i].teleOpMiddleRowCone + ld[i].teleOpBottomRowCone;
    }
  }

  _calculateMostCubes() {
    cubeScored = 0;
    for (int i = 0; i < ld.length; i++) {
      cubeScored += ld[i].autoTopRowCube + ld[i].autoMiddleRowCube + ld[i].autoMiddleRowCube + ld[i].teleOpTopRowCube + ld[i].teleOpMiddleRowCube + ld[i].teleOpBottomRowCube;
    }
  }

  _calculateAverageTeleOpPoints() {
    averageTeleOpPoints = 0;
    for (int i = 0; i < ld.length; i++) {
      averageTeleOpPoints += ld[i].teleOpTotalPoints;
    }
    averageTeleOpPoints = averageTeleOpPoints / ld.length;
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
