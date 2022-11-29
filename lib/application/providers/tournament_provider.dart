import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/application/repositories/tournament_repository.dart';

//!TODO NOT USING YET, this is what allows the api to find the tournaments by it self

class TournamentProvider extends ChangeNotifier {
  List<TournamentModel> tournaments = [
    // for (int i = 1; i < 80; i++)
    //   TournamentModel(
    //     country: "Brazil",
    //     district: "SP",
    //     key: "key",
    //     name: "Tournament $i",
    //     year: 2022,
    //     teams: [
    //       for (int j = 1; j < 8; j++)
    //         TeamModel(
    //           key: "key",
    //           city: "city",
    //           country: "country",
    //           name: "Team $j",
    //           teamNumber: 7419,
    //         ),
    //     ],
    //   ),
    // TournamentModel(
    //   country: "USA",
    //   district: "CA",
    //   key: "MTTD",
    //   name: "MadTown",
    //   year: 2022,
    //   teams: [
    //     for (int j = 1; j < 8; j++)
    //       TeamModel(
    //         key: "key",
    //         city: "city",
    //         country: "country",
    //         name: "Team $j",
    //         teamNumber: 7419,
    //       ),
    //   ],
    // ),
  ];
  TournamentModel? _tournamentModel;

  TournamentModel? get tournamentModel => _tournamentModel;

  set tournamentModel(TournamentModel? tournamentModel) {
    _tournamentModel = tournamentModel;
    notifyListeners();
  }

  List<TournamentModel> _tournamentModels = [];

  List<TournamentModel> get tournamentModels => _tournamentModels;

  set tournamentModels(List<TournamentModel> tournamentModels) {
    tournamentModel = null;
    _tournamentModels = tournamentModels;
    notifyListeners();
  }

  int? _year;

  int? get year => _year;

  set year(int? year) {
    _year = year;
    notifyListeners();
  }

  List<int> _years = [2022, 2023, 2024];

  List<int> get years => _years;

  set years(List<int> years) {
    _years = years;
    notifyListeners();
  }

  // void setYear(
  //     int year, TeamModel teamModel, Function(String errorMessage) onError) {
  //   this.year = year;
  //   getTournamentModels(teamModel, onError);
  // }

  Future<void> getTournamentModels(/*TeamModel teamModel,*/
      /* Function(String errorMessage) onError */) async {
    TournamentRepository tournamentRepository = TournamentRepository();
    var result =
        await tournamentRepository.getTournamentModels(/* teamModel, year!*/);
    result.fold(
      // (l) => onError(l),
      (l) => print(l),
      (r) {
        tournamentModels = r;
        tournaments = r;
      },
    );
  }

  void reset() {
    tournamentModel = null;
    tournamentModels = [];
    year = null;
    notifyListeners();
  }
}
//
// class TournamentProvider extends ChangeNotifier {
//   TournamentModel? _tournamentModel;
//
//   TournamentModel? get tournamentModel => _tournamentModel;
//
//   set tournamentModel(TournamentModel? tournamentModel) {
//     _tournamentModel = tournamentModel;
//     notifyListeners();
//   }
//
//   List<TournamentModel> _tournamentModels = [
//     "Capital Classic City",
//     "Madtown Championship"
//   ];
//
//   List<TournamentModel> get tournamentModels => _tournamentModels;
//
//   set tournamentModels(List<TournamentModel> tournamentModels) {
//     tournamentModel = null;
//     _tournamentModels = tournamentModels;
//     notifyListeners();
//   }
//
//   void reset() {
//     tournamentModel = null;
//     tournamentModels = [];
//     notifyListeners();
//   }
// }
