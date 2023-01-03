import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../application/providers/tournament_provider.dart';
import '../../../themee/colors.dart';
import '../../../themee/fonts.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

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
        title: AutoSizeText("Ranking", maxFontSize: 36, maxLines: 1, style: TextStyle(fontSize: 48, fontFamily: titleFont, color: Colors.white)),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Top 8 Robots", style: TextStyle(fontSize: 20))),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Text("for :", style: TextStyle(fontSize: 20)),
                      SizedBox(width: 10),
                      Expanded(child: Container(height: 30, decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(33)),
              child: Consumer<TournamentProvider>(
                builder: (context, tournamentProvider, widget) {
                  return CupertinoScrollbar(
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
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Text("${index + 1}", style: TextStyle(fontSize: 28, fontFamily: titleFont)),
                              title: Text("NAME", style: TextStyle(fontSize: 20)),
                              trailing: Image.asset("assets/icons/arrow_right.png"),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                      itemCount: 8,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 54),
        ],
      ),
    );
  }
}
