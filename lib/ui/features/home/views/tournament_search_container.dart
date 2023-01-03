import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

// !TODO NOT USING YET, this is the container of where ask for which tournament

class TournamentSearchContainer extends StatelessWidget {
  final TournamentProvider tournamentProvider;
  final TeamProvider teamProvider;

  const TournamentSearchContainer({
    super.key,
    required this.tournamentProvider,
    required this.teamProvider,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10), boxShadow: <BoxShadow>[]),
      child: Align(
        alignment: Alignment.center,
        child: DropdownButton<TournamentModel>(
          value: tournamentProvider.tournamentModel,
          style: const TextStyle(color: black, fontSize: 18),
          elevation: 0,
          hint: const Text("Choose Tournament"),
          items: tournamentProvider.tournamentModels.map((TournamentModel tournamentModel) {
            return DropdownMenuItem<TournamentModel>(
              value: tournamentModel,
              child: Text(
                tournamentModel.name,
                maxLines: 1,
                style: const TextStyle(
                  color: black,
                ),
              ),
            );
          }).toList(),
          onChanged: (TournamentModel? tournamentModel) {
            tournamentProvider.tournamentModel = tournamentModel;
          },
        ),
      ),
    );
  }
}
