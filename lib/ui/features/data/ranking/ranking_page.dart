import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/ranking_provider.dart';

import '../../../../application/providers/data_provider.dart';
import '../../../themee/colors.dart';
import '../../../themee/fonts.dart';
import '../team_page.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key, required this.teamsList, required this.tournamentKey /* required this.teamsStringList, required this.tournamentKey */
      })
      : super(key: key);

  // final List<String> teamsStringList;
  final String tournamentKey;
  final List<String> teamsList;

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  void initState() {
    context.read<RankingProvider>().getTheRankingList(context.read<DataProvider>(), widget.teamsList, widget.tournamentKey, 0);
    // print(widget.dataList);
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
        title: AutoSizeText("Ranking", maxFontSize: 36, maxLines: 1, style: TextStyle(fontSize: 48, fontFamily: titleFont, color: white)),
      ),
      body: Consumer<RankingProvider>(builder: (context, rankingProvider, child) {
        print(rankingProvider.ldWins);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Top Robots", style: TextStyle(fontSize: 20))),
                      SizedBox(height: 14),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("for :", style: TextStyle(fontSize: 20)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: grey),
                                child: DropdownButton<int>(
                                  dropdownColor: grey,
                                  value: rankingProvider.selectedRanking,
                                  style: TextStyle(fontSize: 20, color: black),
                                  underline: SizedBox.shrink(),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Most Victories"),
                                      value: 0,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Autonomous"),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Tele Op"),
                                      value: 2,
                                    ),
                                  ],
                                  onChanged: (value) {
                                    rankingProvider.changeSelectedRanking(value!);
                                    rankingProvider.getTheRankingList(context.read<DataProvider>(), widget.teamsList, widget.tournamentKey, value!);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(33)),
                  child: rankingProvider.ldWins.isNotEmpty
                      ? CupertinoScrollbar(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => TeamPage(
                                  //       teamNumber: int.parse(tournamentProvider.teamsInTournament[index].substring(3, tournamentProvider.teamsInTournament[index].length)),
                                  //       tournamentKey: tournamentModel.key,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => TeamPage(
                                                teamNumber: int.parse(rankingProvider.teamsSorted[index].substring(3)),
                                                tournamentKey: widget.tournamentKey,
                                              )));
                                    },
                                    child: ListTile(
                                      leading: Text("${index + 1}", style: TextStyle(fontSize: 28, fontFamily: titleFont)),
                                      title: Text(rankingProvider.teamsSorted[index].substring(3), style: TextStyle(fontSize: 20)),
                                      trailing: Image.asset("assets/icons/arrow_right.png"),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 16);
                            },
                            itemCount: rankingProvider.ldWins.length,
                          ),
                        )
                      : Center(child: CircularProgressIndicator(color: darkGrey)),
                ),
              ),
              SizedBox(height: 54),
            ],
          ),
        );
      }),
    );
  }
}
