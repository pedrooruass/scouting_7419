import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/team_visits_submit_model.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/team_visits_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/application/repositories/team_visits_submit_repository.dart';

class TeamVisitsSubmitProvider extends ChangeNotifier {
  Future<void> submitVisit({
    required TeamVisitsProvider teamVisitsProvider,
    required TournamentProvider tournamentProvider,
    required ProfileProvider profileProvider,
    required TeamProvider teamProvider,
    required BuildContext context,
  }) async {
    showDialog(
        context: context,
        builder: (context) {
// return Center(child: CircularProgressIndicator(color: grey));
          return Center(child: Image.asset("assets/gif/7419_2.gif"));
        });
    TeamVisitsSubmitModel teamVisitsSubmitModel = TeamVisitsSubmitModel(
      tournamentKey: tournamentProvider.tournamentModel!.key,
      scouterName: profileProvider.userName!,
      teamNumber: teamProvider.teamModel!.teamNumber,
      programingQ1: teamVisitsProvider.teamVisitsModel.programingQ1.text,
      programingQ2: teamVisitsProvider.teamVisitsModel.programingQ2.text,
      programingQ3: teamVisitsProvider.teamVisitsModel.programingQ3.text,
      programingQ4: teamVisitsProvider.teamVisitsModel.programingQ4.text,
      programingQ5: teamVisitsProvider.teamVisitsModel.programingQ5.text,
      programingQ6: teamVisitsProvider.teamVisitsModel.programingQ6.text,
      programingQ7: teamVisitsProvider.teamVisitsModel.programingQ7.text,
      programingQ8: teamVisitsProvider.teamVisitsModel.programingQ8.text,
      programingExtra: teamVisitsProvider.teamVisitsModel.programingExtra.text,
      hardwareQ1: teamVisitsProvider.teamVisitsModel.hardwareQ1.text,
      hardwareQ2: teamVisitsProvider.teamVisitsModel.hardwareQ2.text,
      hardwareQ3: teamVisitsProvider.teamVisitsModel.hardwareQ3.text,
      hardwareQ4: teamVisitsProvider.teamVisitsModel.hardwareQ4.text,
      hardwareQ5: teamVisitsProvider.teamVisitsModel.hardwareQ5.text,
      hardwareQ6: teamVisitsProvider.teamVisitsModel.hardwareQ6.text,
      hardwareExtra: teamVisitsProvider.teamVisitsModel.hardwareExtra.text,
      businessQ1: teamVisitsProvider.teamVisitsModel.businessQ1.text,
      businessQ2: teamVisitsProvider.teamVisitsModel.businessQ2.text,
      businessQ3: teamVisitsProvider.teamVisitsModel.businessQ3.text,
      businessQ4: teamVisitsProvider.teamVisitsModel.businessQ4.text,
      businessQ5: teamVisitsProvider.teamVisitsModel.businessQ5.text,
      businessQ6: teamVisitsProvider.teamVisitsModel.businessQ6.text,
      businessQ7: teamVisitsProvider.teamVisitsModel.businessQ7.text,
      businessQ8: teamVisitsProvider.teamVisitsModel.businessQ8.text,
      businessExtra: teamVisitsProvider.teamVisitsModel.businessExtra.text,
    );

    TeamVisitsSubmitRepository teamVisitsSubmitRepository = TeamVisitsSubmitRepository();
    await teamVisitsSubmitRepository.submitVisits(teamVisitsSubmitModel);
    teamVisitsProvider.reset();
    teamProvider.reset();
    Navigator.pop(context);
    tournamentProvider.reset();
  }
}
