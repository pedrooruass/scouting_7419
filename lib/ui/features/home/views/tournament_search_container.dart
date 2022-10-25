import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/features/home/views/show_dialog.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

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
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          DropdownButton<int>(
            value: tournamentProvider.year,
            hint: Text(
              "Year",
              style: TextStyle(
                color: darkGrey,
                fontFamily: titleFont,
                fontSize: 16,
              ),
            ),
            items: tournamentProvider.years.map((int year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(
                  "$year",
                  style: TextStyle(
                    color: darkGrey,
                    fontFamily: titleFont,
                    fontSize: 16,
                  ),
                ),
              );
            }).toList(),
            onChanged: (int? year) {
              tournamentProvider.setYear(
                year!,
                teamProvider.teamModel!,
                (errorMessage) => displayTextDialog(context, title: errorMessage),
              );
            },
          ),
          const Spacer(),
          DropdownButton<TournamentModel>(
            value: tournamentProvider.tournamentModel,
            hint: const Text(
              "Choose Tournament",
              style: TextStyle(
                color: black,
              ),
            ),
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
        ],
      ),
    );
  }
}
