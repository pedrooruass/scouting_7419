import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

// !TODO NOT USING YET, this is the container of where ask for which tournament

class TournamentSearchContainer extends StatelessWidget {
  final TournamentProvider tournamentProvider;

  const TournamentSearchContainer({
    super.key,
    required this.tournamentProvider,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10), boxShadow: <BoxShadow>[]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/icons/search_icon.png"),
          Align(
            alignment: Alignment.center,
            child: DropdownButton<TournamentModel>(
              disabledHint: Text("No Tournaments"),
              hint: Text(
                "Select Tournament",
                style: TextStyle(color: black),
              ),
              value: tournamentProvider.tournamentModel,
              underline: SizedBox.shrink(),
              style: const TextStyle(color: black, fontSize: 18),
              items: tournamentProvider.tournamentModels.map((TournamentModel tournamentModel) {
                return DropdownMenuItem<TournamentModel>(
                  value: tournamentModel,
                  child: AutoSizeText(tournamentModel.name, maxLines: 1, style: const TextStyle(color: black)),
                );
              }).toList(),
              onChanged: (TournamentModel? tournamentModel) {
                tournamentProvider.tournamentModel = tournamentModel;
              },
            ),
          ),
        ],
      ),
    );
  }
}
