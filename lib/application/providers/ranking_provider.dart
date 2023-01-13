import 'package:flutter/material.dart';
import 'package:scoring_7419/application/providers/data_provider.dart';

class RankingProvider extends ChangeNotifier {
  int selectedRanking = 0;
  Map<String, int> ldWins = {};
  List<String> teamsSorted = [];
  List<int> valueSorted = [];

  getTheRankingList(DataProvider dt, List<String> teamsInTournament, String tournamentKey, int index) async {
    ldWins = {};
    teamsSorted = [];
    valueSorted = [];
    //how to store the values?
    for (int i = 0; i < teamsInTournament.length; i++) {
      await dt.getTeamDataInTournament(teamNumber: int.parse(teamsInTournament[i].substring(3, teamsInTournament[i].length)), tournamentKey: tournamentKey);
      ldWins[teamsInTournament[i]] = index == 0
          ? dt.teamWins
          : index == 1
              ? dt.averageAutonomousPoints.toInt()
              : dt.averageTeleOpPoints.toInt(); //just get the same index from the teamsStringList
    }
    List<MapEntry<String, int>> mapEntries = ldWins.entries.toList();
    mapEntries.sort((a, b) => b.value.compareTo(a.value));
    ldWins = Map.fromEntries(mapEntries);
    teamsSorted = ldWins.keys.toList();
    valueSorted = ldWins.values.toList();
    notifyListeners();
  }

  changeSelectedRanking(int index) {
    selectedRanking = index;
    notifyListeners();
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
