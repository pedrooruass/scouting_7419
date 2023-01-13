import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/application/repositories/tournament_repository.dart';

//!TODO NOT USING YET, this is what allows the api to find the tournaments by it self

class TournamentProvider extends ChangeNotifier {
  TournamentModel? _tournamentModel;
  List<String> _teamsInTournament = [];

  List<String> get teamsInTournament => _teamsInTournament;

  set teamsInTournament(List<String> value) {
    _teamsInTournament = value;
    notifyListeners();
  }

  TournamentModel? get tournamentModel => _tournamentModel;

  set tournamentModel(TournamentModel? tournamentModel) {
    _tournamentModel = tournamentModel;
    notifyListeners();
  }

  List<TournamentModel> _tournamentModels = [];

  List<TournamentModel> get tournamentModels => _tournamentModels;

  set tournamentModels(List<TournamentModel> tournamentModels) {
    _tournamentModels = tournamentModels;
    notifyListeners();
  }

  Future<void> getTournamentModels() async {
    TournamentRepository tournamentRepository = TournamentRepository();
    var result = await tournamentRepository.getTournamentModels(/* teamModel, year!*/);
    result.fold(
      // (l) => onError(l),
      (l) => print(l),
      (r) {
        tournamentModels = r;
      },
    );
  }

  Future<void> getTeamsListInTournament(String eventKey) async {
    teamsInTournament = [];
    TournamentRepository tournamentRepository = TournamentRepository();
    var result = await tournamentRepository.getTeamModelInTournament(eventKey);
    result.fold(
      (l) => print(l),
      (r) {
        teamsInTournament = r;
      },
    );
  }

  void reset() {
    tournamentModel = null;
    teamsInTournament = [];
    notifyListeners();
  }
}
