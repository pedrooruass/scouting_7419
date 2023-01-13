import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/ui/features/home/views/mode_container.dart';
import 'package:scoring_7419/ui/features/home/views/tournament_search_container.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

import '../../../application/providers/tournament_provider.dart';
import '../../themee/colors.dart';
import '../home/views/team_and_scouter_row.dart';

class TeamVisitsPage extends StatelessWidget {
  const TeamVisitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(backgroundColor: black, elevation: 0, centerTitle: true, title: AutoSizeText("Team Visits", maxFontSize: 36, maxLines: 1, style: TextStyle(fontSize: 48, fontFamily: titleFont, color: Colors.white))),
      body: Consumer<TeamProvider>(builder: (context, teamProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 24),
              TournamentSearchContainer(
                tournamentProvider: Provider.of<TournamentProvider>(context),
                teamProvider: teamProvider,
              ),
              const SizedBox(height: 24),
              TeamAndScouterRow(
                teamProvider: teamProvider,
                // tournamentProvider: tournamentProvider,
              ),
              const SizedBox(height: 24),
              ModeContainer(
                widgets: [
                  Container(
                    color: grey,
                    margin: EdgeInsets.all(5),
                    height: 100,
                  ),
                ],
                modeTitle: "Pros",
              ),
              const SizedBox(height: 24),
              ModeContainer(
                widgets: [
                  Container(
                    color: grey,
                    margin: EdgeInsets.all(5),
                    height: 100,
                  ),
                ],
                modeTitle: "Cons",
              ),
              const SizedBox(height: 24),
              ModeContainer(
                widgets: [
                  Container(
                    color: grey,
                    margin: EdgeInsets.all(5),
                    height: 100,
                  ),
                ],
                modeTitle: "General",
              ),
            ],
          ),
        );
      }),
    );
  }
}
