import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/ui/features/data/custom_search_team_delegate.dart';
import 'package:scoring_7419/ui/features/data/ranking/ranking_page.dart';
import 'package:scoring_7419/ui/features/data/team_page.dart';

import '../../../application/providers/tournament_provider.dart';
import '../../themee/colors.dart';
import '../../themee/fonts.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key, required this.tournamentModel}) : super(key: key);

  final TournamentModel tournamentModel;

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  void initState() {
    context.read<TournamentProvider>().getTeamsListInTournament(widget.tournamentModel.key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/icons/arrow_left.png")),
          title: AutoSizeText("Teams", maxFontSize: 36, maxLines: 1, style: TextStyle(fontSize: 48, fontFamily: titleFont, color: Colors.white)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RankingPage(teamsList: context.read<TournamentProvider>().teamsInTournament, tournamentKey: widget.tournamentModel.key)));
                },
                icon: Icon(FontAwesomeIcons.rankingStar, color: yellow))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                height: 80,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      widget.tournamentModel.name,
                      style: TextStyle(fontSize: 16, fontFamily: titleFont),
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("City: " + widget.tournamentModel.city, style: TextStyle(fontSize: 12, fontFamily: titleFont)),
                            Text("Country: " + widget.tournamentModel.country, style: TextStyle(fontSize: 12, fontFamily: titleFont)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("State: " + widget.tournamentModel.state_prov, style: TextStyle(fontSize: 12, fontFamily: titleFont)),
                            Text("Year: " + widget.tournamentModel.year.toString(), style: TextStyle(fontSize: 12, fontFamily: titleFont)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchTeamDelegate(
                        teamList: context.read<TournamentProvider>().teamsInTournament,
                        tournamentKey: widget.tournamentModel.key,
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
                    builder: (context, tournamentProvider, child) {
                      return tournamentProvider.teamsInTournament.isNotEmpty
                          ? CupertinoScrollbar(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => TeamPage(
                                            teamNumber: int.parse(tournamentProvider.teamsInTournament[index].substring(3, tournamentProvider.teamsInTournament[index].length)),
                                            tournamentKey: widget.tournamentModel.key,
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
              SizedBox(height: 54),
            ],
          ),
        ));
  }
}
