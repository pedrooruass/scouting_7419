import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/data_model.dart';
import 'package:scoring_7419/application/providers/data_provider.dart';

class RankingProvider extends ChangeNotifier {
  Map<String, double> listOfTeamsWLRatioInTournament = {};
  double TeamLossRatio = 0.0;
  List<DataModel> ldTop = []; // Win loss ratio
  List<DataModel> ldTopAutoAverage = [];
  List<DataModel> ldTopTeleOpAverage = [];
  List<DataModel> ldTopEndGameAverage = [];
  List<DataModel> ldTopHangerAverage = [];

  calculateRankingLists() {
    _calculateRankingWinList();
    _calculateRankingAVGAutonomousList();
    _calculateRankingAVGTeleOpList();
    _calculateRankingAVGEndGameList();
  }

  _calculateRankingWinList() {}

  _calculateRankingAVGAutonomousList() {}

  _calculateRankingAVGTeleOpList() {}

  _calculateRankingAVGEndGameList() {}


  getTheListForTeamWins(DataProvider dt, List<String> teamsInTournament, String tournamentKey) async {
    dynamic listOfResults = [];
    //how to store the values?
    for (int i = 0; i < teamsInTournament.length; i++) {
      await dt.getTeamDataInTournament(teamNumber: int.parse(teamsInTournament[i].substring(3, teamsInTournament[i].length)), tournamentKey: tournamentKey);
      listOfResults.add(teamsInTournament[i]); //just get the same index from the teamsStringList
      listOfResults.add(dt.teamWins);
    }
    return listOfResults;
  }

/*
  *
  * {
  *               [WinLossRatio, AVGAuto, AVGTeleOp, AVGEndGame]
  *   "frc7419" : [5.3, 7.3, 8.9, 9.8],
  *   "frc1378" : 7.2,
  * }
  *
  * map.toList() // Is there a way to sort a map by its values ?
  * map.sort()
  * displayList = originalList[0 -> 7]
  * return displayList;
  *
  *
  * */
}
