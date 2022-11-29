import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/features/data/custom_search_tournament_delegate.dart';
import 'package:scoring_7419/ui/features/data/tournament_page.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    TournamentProvider().getTournamentModels(); // ideally change to provider
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Data",
          style: TextStyle(
            fontSize: 48,
            fontFamily: titleFont,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                // displayTextInputDialog(context, title: "Tournament Name");
                // context
                //     .read<TournamentProvider>()
                //     .getTournamentModels((errorMessage) => "null");
                // tournamentList = tournamentR.getTournamentModels(2022);
                showSearch(
                  context: context,
                  delegate: CustomSearchTournamentDelegate(
                    tournamentList:
                        context.read<TournamentProvider>().tournaments,
                  ),
                );
                TournamentProvider().getTournamentModels();
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
                      "Search Tournament",
                      style: TextStyle(
                        fontSize: 20,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     displayTextInputDialog(context, title: "Tournament Name");
            //     context.read<TournamentProvider>().getTournamentModels(
            //         TeamModel(
            //           teamNumber: 7419,
            //           key: "frc7419",
            //           name: "TechSupport",
            //           city: "Dublin",
            //           stateProv: "CA",
            //           country: "USA",
            //           nickname: "Techsupport",
            //         ),
            //         (errorMessage) => "null");
            //   },
            //   child: Container(
            //     height: 50,
            //     decoration: BoxDecoration(
            //       color: white,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Image.asset("assets/icons/search_icon.png"),
            //         Text(
            //           "Search Tournament",
            //           style: TextStyle(
            //             fontSize: 20,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(33),
                ),
                child: CupertinoScrollbar(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // context.read<TournamentProvider>().getTournamentModels(
                          //     context.read<TournamentProvider>().tournaments[index],
                          //     (errorMessage) => "null"); // Copilot code
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TournamentPage(
                                tournament: context
                                    .read<TournamentProvider>()
                                    .tournamentModels[index],
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
                              decoration: BoxDecoration(
                                color: darkGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // child: Text(
                              //   "${context.read<TournamentProvider>().tournaments[index].year}",
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //   ),
                              // ),
                            ),
                            title: Text(
                              context
                                  .read<TournamentProvider>()
                                  .tournamentModels[index]
                                  .name,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            trailing:
                                Image.asset("assets/icons/arrow_right.png"),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
                    itemCount: context
                        .read<TournamentProvider>()
                        .tournamentModels
                        .length,
                  ),
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
