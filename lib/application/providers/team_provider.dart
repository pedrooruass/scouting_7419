import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/team_model.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/application/repositories/team_repository.dart';

class TeamProvider extends ChangeNotifier {
  TeamModel? _teamModel;

  TeamModel? get teamModel => _teamModel;

  set teamModel(TeamModel? teamModel) {
    _teamModel = teamModel;
    notifyListeners();
  }

  Future<void> getTeamModelByNumber(
      String teamId,
      Function(String errorMessage) onError) async {
    int teamNumber = int.tryParse(teamId) ?? 0;
    if (teamNumber == 0) {
      onError("Invalid team number");
      return;
    } // verify if it is a valid number
    TeamRepository teamRepository = TeamRepository();
    var result = await teamRepository.getTeamModel(teamNumber);
    result.fold(
      (l) => onError(l),
      (r) {
        teamModel = r;
      },
    ); // left error, Right success
  }
}
