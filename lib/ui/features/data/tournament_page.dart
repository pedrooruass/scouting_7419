import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';
import 'package:scoring_7419/ui/features/home/charts.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class TournamentPage extends StatelessWidget {
  final TournamentModel tournament;

  const TournamentPage({Key? key, required this.tournament}) : super(key: key);

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
        title: AutoSizeText(
          "Tournament Data",
          maxLines: 1,
          minFontSize: 12,
          style: TextStyle(
            fontSize: 32,
            fontFamily: titleFont,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Charts(
                title: tournament.name,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // // displayTextInputDialog(context, title: "Tournament Name");
                    // showSearch(
                    //   context: context,
                    //   delegate: CustomSearchDelegate(
                    //     tournamentList:
                    //     // context.read<TournamentProvider>().tournaments[0].teams,
                    //   ),
                    // );
                    // showSearch(
                    //   context: context,
                    //   delegate: CustomSearchTeamDelegate(
                    //     teamList: tournament.teams,
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/icons/search_icon.png"),
                        Text(
                          "Search Teams",
                          style: TextStyle(
                            fontSize: 20,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Expanded(
              //   child: Container(
              //     margin: const EdgeInsets.symmetric(horizontal: 8.0),
              //     padding: EdgeInsets.all(22),
              //     decoration: BoxDecoration(
              //       color: grey,
              //       borderRadius: BorderRadius.circular(33),
              //     ),
              //     child: CupertinoScrollbar(
              //       child: ListView.separated(
              //         itemBuilder: (context, index) {
              //           return GestureDetector(
              //             onTap: () {
              //               // Navigator.of(context).push(
              //               //   MaterialPageRoute(
              //               //     builder: (context) => TeamPage(
              //               //       team: tournament.teams[index],
              //               //     ),
              //               //   ),
              //               // );
              //             },
              //             child: Container(
              //               padding: EdgeInsets.all(4),
              //               decoration: BoxDecoration(
              //                 color: white,
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: ListTile(
              //                 leading: Container(
              //                   height: 44,
              //                   width: 44,
              //                   decoration: BoxDecoration(
              //                     color: darkGrey,
              //                     borderRadius: BorderRadius.circular(10),
              //                   ),
              //                   // child: Text(
              //                   //   "${context.read<TournamentProvider>().tournaments[index].year}",
              //                   //   style: TextStyle(
              //                   //     color: Colors.white,
              //                   //   ),
              //                   // ),
              //                 ),
              //                 title: Text(
              //                   // tournament.teams[index].name,
              //                   "Team Name",
              //                   style: TextStyle(
              //                     fontSize: 20,
              //                   ),
              //                 ),
              //                 trailing:
              //                     Image.asset("assets/icons/arrow_right.png"),
              //               ),
              //             ),
              //           );
              //         },
              //         separatorBuilder: (context, index) {
              //           return SizedBox(height: 16);
              //         },
              //         itemCount: tournament //!TODO Como achar o index???
              //             .teams
              //             .length,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
* Tournament:
* Name, Country, District, year, teams
*
* */
