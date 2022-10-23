import 'package:flutter/material.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/features/home/views/input_dialog.dart';
import 'package:scoring_7419/ui/features/home/views/show_dialog.dart';
import 'package:scoring_7419/ui/features/profile/profile_page.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class TeamAndScouterRow extends StatelessWidget {
  final TeamProvider teamProvider;
  final TournamentProvider tournamentProvider;
  const TeamAndScouterRow({
    Key? key,
    required this.teamProvider,
    required this.tournamentProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                chooseTeamNumber(context, teamProvider, tournamentProvider);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                teamProvider.teamModel?.teamNumber.toString() ?? "Team #",
                style: const TextStyle(
                  color: black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Text(
              "Scouter Name",
              style: TextStyle(
                color: black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void chooseTeamNumber(BuildContext context, TeamProvider teamProvider, TournamentProvider tournamentProvider ) async {
    String? teamNumber = await displayTextInputDialog(
      context,
      title: "Team Number",
    );
    if (teamNumber != null) {
      teamProvider.getTeamModelByNumber(
        teamNumber,
        (errorMessage) => displayTextDialog(context, title: errorMessage),
      );
    }
  }
}
