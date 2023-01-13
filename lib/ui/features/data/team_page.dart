import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/data_provider.dart';
import 'package:scoring_7419/ui/features/data/specific_team_data_chart.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

import 'general_team_data_chart.dart';

class TeamPage extends StatefulWidget {
  // final TeamModel team; // shouldnt be TeamDataModel?
  final int teamNumber;
  final String tournamentKey;

  // final TournamentModel tournamentModel;

  const TeamPage({
    Key? key,
    required this.teamNumber,
    required this.tournamentKey,
    /* required this.tournamentModel */
  }) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  void initState() {
    // context.read<DataProvider>().startListenTeamData(widget.teamNumber, widget.tournamentKey);
    context.read<DataProvider>().getTeamDataInTournament(tournamentKey: widget.tournamentKey, teamNumber: widget.teamNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, dataProvider, child) {
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
          title: AutoSizeText(
            "Team Page",
            maxLines: 1,
            minFontSize: 12,
            style: TextStyle(
              fontSize: 32,
              fontFamily: titleFont,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AutoSizeText(
                        "Loss",
                        style: TextStyle(
                          color: white,
                          fontFamily: titleFont,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      AutoSizeText(
                        dataProvider.teamLoss.toString(),
                        style: TextStyle(
                          color: red,
                          fontFamily: titleFont,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    maxRadius: 70,
                    backgroundColor: grey,
                    child: AutoSizeText(
                      widget.teamNumber.toString(),
                      style: TextStyle(color: black, fontFamily: titleFont, fontSize: 26),
                    ),
                  ),
                  Column(
                    children: [
                      AutoSizeText(
                        "Win",
                        style: TextStyle(
                          color: white,
                          fontFamily: titleFont,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      AutoSizeText(
                        dataProvider.teamWins.toString(),
                        style: TextStyle(
                          color: green,
                          fontFamily: titleFont,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 54),
              Visibility(
                visible: dataProvider.ld.isNotEmpty,
                child: Column(
                  children: [
                    GeneralTeamDataChart(title: "Average Points Data View"),
                    //TODO should i do this ? hahahahaha
                    SizedBox(height: 24),
                    FlutterToggleTab(
                      borderRadius: 10,
                      height: 40,
                      unSelectedBackgroundColors: [darkGrey, grey, darkGrey],
                      selectedIndex: dataProvider.chartIndexSelected,
                      selectedBackgroundColors: gradient2,
                      selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                      unSelectedTextStyle: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
                      labels: const ["Auto", "TeleOp"],
                      selectedLabelIndex: (index) {
                        dataProvider.changeChartIndex(index);
                      },
                      isScroll: false,
                    ),
                    SizedBox(height: 24),
                    SpecificTeamDataChart(title: "Specific", indexSelected: dataProvider.chartIndexSelected),
                  ],
                ),
                replacement: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "This team has no Data, GO SCOUT!!!",
                        style: TextStyle(
                          color: white,
                          fontFamily: titleFont,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Image.asset(
                      "assets/gif/7419_2.gif",
                      height: 300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // : Center(child: CircularProgressIndicator()),
      );
    });
  }
}
