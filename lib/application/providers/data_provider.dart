import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/data_model.dart';

class DataProvider extends ChangeNotifier {
  // Map<String, DataModel> teamDatas = {};
  List<DataModel> ld = [];
  List<DataModel> ldTop8 = []; // Win loss ratio
  List<DataModel> ldTop8AutoAverage = [];
  List<DataModel> ldTop8TeleOpAverage = [];
  List<DataModel> ldTop8EndGameAverage = [];
  List<DataModel> ldTopHangerAverage = [];
  int teamWins = 0;
  int teamLoss = 0;
  double averageAutonomousPoints = 0;
  double averageTeleOpPoints = 0;
  double averageEndGamePoints = 0;

  // startListenTeamData(int teamNumber, String tournamentKey) async {
  //   DataRepository teamData = DataRepository();
  //   teamData.startListenTeamDataInTournament(
  //       teamNumber: teamNumber,
  //       tournamentKey: tournamentKey,
  //       onEvent: (event) {
  //         if (event.eventType == DataRepositoryEventType.added) {
  //           teamDatas[event.dataModel.id!] = event.dataModel;
  //           notifyListeners();
  //         } else if (event.eventType == DataRepositoryEventType.modified) {
  //           teamDatas[event.dataModel.toString()] = event.dataModel;
  //         } else if (event.eventType == DataRepositoryEventType.removed) {
  //           teamDatas.remove(event.dataModel.id!);
  //         }
  //         _calculateTeamWins();
  //         _calculateAverageAutonomousPoints();
  //         _calculateAverageTeleOpPoints();
  //         _calculateAverageEndGamePoints();
  //         notifyListeners();
  //       });
  // }

  // getTeamDataInTournament(String tournamentKey, int teamNumber) async {
  //   DataRepository teamData = DataRepository();
  //   ld = teamData.getTeamDataInTournament(tournamentKey: tournamentKey, teamNumber: teamNumber);
  //   print(ld);
  //   notifyListeners();
  // }

  getTeamDataInTournament({required int teamNumber, required String tournamentKey}) {
    ld = [];
    teamWins = 0;
    teamLoss = 0;
    averageAutonomousPoints = 0;
    averageTeleOpPoints = 0;
    averageEndGamePoints = 0;
    FirebaseFirestore.instance.collection('scoring').where("tournamentKey", isEqualTo: tournamentKey).where("teamNumber", isEqualTo: teamNumber).get().then((snapshot) => snapshot.docs.forEach((doc) {
          print(doc.id);
          ld += [DataModel.fromJson(doc.data())];
          _calculateTeamWins();
          _calculateAverageAutonomousPoints();
          _calculateAverageTeleOpPoints();
          _calculateAverageEndGamePoints();
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

  _calculateAverageEndGamePoints() {
    averageEndGamePoints = 0;
    for (int i = 0; i < ld.length; i++) {
      averageEndGamePoints += ld[i].endGameTotalPoints;
    }
    averageEndGamePoints = averageEndGamePoints / ld.length;
  }

//  Charts usage
  int chartIndexSelected = 0;
  List<String> chartTitles = ["Autonomous", "TeleOp", "End Game"];

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
          _calculateAverageEndGamePoints();
          _calculateTop8TeamsInTournament();
          notifyListeners();
        }));
  }

  //Get teams, Get teams win ratio, Get the top 8 on the list
  _calculateTop8TeamsInTournament() {
    ldTop8 = [];
    for (int i = 0; i < ld.length; i++) {
      if (ld[i].isWinner) {
        ldTop8 += [ld[i]];
      }
    }
  }

// _calculateTeamWins() {
//   teamWins = 0;
//   teamLoss = 0;
//   teamDatas.forEach(
//     (key, value) {
//       if (value.isWinner) {
//         teamWins++;
//       } else if (value.isNotWinner) {
//         teamLoss++;
//       }
//     },
//   );
// }

// _calculateAverageAutonomousPoints() {
//   averageAutonomousPoints = 0;
//   teamDatas.forEach((key, value) {
//     averageAutonomousPoints += value.autoTotalPoints;
//   });
//   averageAutonomousPoints = averageAutonomousPoints / teamDatas.length;
// }
//
// _calculateAverageTeleOpPoints() {
//   averageTeleOpPoints = 0;
//   teamDatas.forEach((key, value) {
//     averageTeleOpPoints += value.teleOpTotalPoints;
//   });
//   averageTeleOpPoints = averageTeleOpPoints / teamDatas.length;
// }
//
// _calculateAverageEndGamePoints() {
//   averageEndGamePoints = 0;
//   teamDatas.forEach((key, value) {
//     averageEndGamePoints += value.endGameTotalPoints;
//   });
//   averageEndGamePoints = averageEndGamePoints / teamDatas.length;
// }

// reset() {
//   ld = [];
//   teamWins = 0;
//   teamLoss = 0;
//   notifyListeners();
// }
}
