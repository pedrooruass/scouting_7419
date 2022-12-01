import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/features/data/custom_search_team_delegate.dart';
import 'package:scoring_7419/ui/features/data/team_page.dart';
import 'package:scoring_7419/ui/features/home/charts.dart';
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
        title: AutoSizeText("Tournament Data", maxLines: 1, minFontSize: 12, style: TextStyle(fontSize: 32, fontFamily: titleFont, color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Charts(title: widget.tournament.name + " - " + widget.tournament.year.toString()),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchTeamDelegate(
                        teamList: context.read<TournamentProvider>().teamsInTournament,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/icons/search_icon.png"),
                        Text("Search Teams", style: TextStyle(fontSize: 20, color: black)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(33)),
                  child: Consumer<TournamentProvider>(
                    builder: (context, tournamentProvider, widget) {
                      return tournamentProvider.teamsInTournament.isNotEmpty
                          ? CupertinoScrollbar(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => TeamPage(
                                            teamKey: tournamentProvider.teamsInTournament[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          height: 44,
                                          width: 44,
                                          decoration: BoxDecoration(color: darkGrey, borderRadius: BorderRadius.circular(10)),
                                          child: Icon(FontAwesomeIcons.users, color: white),
                                        ),
                                        title: Text("#" + tournamentProvider.teamsInTournament[index].substring(3, tournamentProvider.teamsInTournament[index].length), style: TextStyle(fontSize: 20)),
                                        trailing: Image.asset("assets/icons/arrow_right.png"),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 16);
                                },
                                itemCount: tournamentProvider.teamsInTournament.length,
                              ),
                            )
                          : Center(child: CircularProgressIndicator(color: darkGrey));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
