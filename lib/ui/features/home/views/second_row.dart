import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/ui/features/home/views/input_dialog.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class SecondRow extends StatelessWidget {
  const SecondRow({Key? key}) : super(key: key);

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
                chooseMatchNumber(context, context.read<TeamProvider>());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Match Number",
                // teamProvider.teamModel?.teamNumber.toString() ?? "Team #",
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
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // context.read<SecondRowProvider>.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Alliance Color",
                // teamProvider.teamModel?.teamNumber.toString() ?? "Team #",
                style: const TextStyle(
                  color: black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void chooseMatchNumber(
    BuildContext context,
    TeamProvider teamProvider,
    /* TournamentProvider tournamentProvider*/
  ) async {
    String? teamNumber = await displayTextInputDialog(
      context,
      title: "Match Number",
    );
  }
}
