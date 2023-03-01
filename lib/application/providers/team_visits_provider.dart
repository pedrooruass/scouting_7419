import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/team_visits_model.dart';

class TeamVisitsProvider extends ChangeNotifier {
  TeamVisitsModel teamVisitsModel = TeamVisitsModel();

  void reset() {
    teamVisitsModel.tournamentKey = "";
    teamVisitsModel.scouterName = "";
    teamVisitsModel.teamNumber = 0;

    teamVisitsModel.programingQ1.clear();
    teamVisitsModel.programingQ2.clear();
    teamVisitsModel.programingQ3.clear();
    teamVisitsModel.programingQ4.clear();
    teamVisitsModel.programingQ5.clear();
    teamVisitsModel.programingQ6.clear();
    teamVisitsModel.programingQ7.clear();
    teamVisitsModel.programingQ8.clear();
    teamVisitsModel.programingExtra.clear();

    teamVisitsModel.hardwareQ1.clear();
    teamVisitsModel.hardwareQ2.clear();
    teamVisitsModel.hardwareQ3.clear();
    teamVisitsModel.hardwareQ4.clear();
    teamVisitsModel.hardwareQ5.clear();
    teamVisitsModel.hardwareQ6.clear();
    teamVisitsModel.hardwareExtra.clear();

    teamVisitsModel.businessQ1.clear();
    teamVisitsModel.businessQ2.clear();
    teamVisitsModel.businessQ3.clear();
    teamVisitsModel.businessQ4.clear();
    teamVisitsModel.businessQ5.clear();
    teamVisitsModel.businessQ6.clear();
    teamVisitsModel.businessQ7.clear();
    teamVisitsModel.businessQ8.clear();
    teamVisitsModel.businessExtra.clear();

    notifyListeners();
  }
}
