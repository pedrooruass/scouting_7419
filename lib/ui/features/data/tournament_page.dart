import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/features/data/general_team_data_chart.dart';
import 'package:scoring_7419/ui/features/data/ranking/ranking_page.dart';
import 'package:scoring_7419/ui/features/data/teams_page.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class TournamentPage extends StatefulWidget {
  final TournamentModel tournament;

  const TournamentPage({Key? key, required this.tournament}) : super(key: key);

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  @override
  void initState() {
    // context.read<TournamentProvider>().teamsInTournament = [];
    context.read<TournamentProvider>().getTeamsListInTournament(widget.tournament.key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/arrow_left.png")),
        title: AutoSizeText("Data", maxLines: 1, minFontSize: 12, style: TextStyle(fontSize: 32, fontFamily: titleFont, color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              GeneralTeamDataChart(title: widget.tournament.name + " - " + widget.tournament.year.toString()),
              SizedBox(height: 24),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeamsPage(tournamentModel: widget.tournament)));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: grey, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Container(height: 80, alignment: Alignment.center, child: AutoSizeText("Teams", maxLines: 1, style: TextStyle(fontSize: 32, fontFamily: titleFont, color: darkGrey)))),
              SizedBox(height: 24),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RankingPage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: grey, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Container(height: 80, alignment: Alignment.center, child: AutoSizeText("Ranking", maxLines: 1, style: TextStyle(fontSize: 32, fontFamily: titleFont, color: darkGrey)))),
            ],
          ),
        ),
      ),
    );
  }
}
