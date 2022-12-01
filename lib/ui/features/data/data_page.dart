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
  initState() {
    context.read<TournamentProvider>().getTournamentModels();
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
        title: Text("Data", style: TextStyle(fontSize: 48, fontFamily: titleFont, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchTournamentDelegate(tournamentList: context.read<TournamentProvider>().tournamentModels));
                print(context.read<TournamentProvider>().tournamentModels);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
            SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(33),
                ),
                child: Consumer<TournamentProvider>(
                  builder: (context, tournamentProvider, widget) {
                    return tournamentProvider.tournamentModels.isNotEmpty
                        ? CupertinoScrollbar(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TournamentPage(tournament: tournamentProvider.tournamentModels[index])));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
                                    child: ListTile(
                                      leading: Container(alignment: Alignment.center, height: 44, width: 44, decoration: BoxDecoration(color: darkGrey, borderRadius: BorderRadius.circular(10)), child: Text(tournamentProvider.tournamentModels[index].year.toString(), style: TextStyle(fontSize: 14, color: white))),
                                      title: Text(tournamentProvider.tournamentModels[index].name, style: TextStyle(fontSize: 18)),
                                      subtitle: Text(tournamentProvider.tournamentModels[index].city + ", " + tournamentProvider.tournamentModels[index].state_prov, style: TextStyle(fontSize: 14)),
                                      trailing: Image.asset("assets/icons/arrow_right.png"),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(height: 16),
                              itemCount: tournamentProvider.tournamentModels.length,
                            ),
                          )
                        : Center(child: CircularProgressIndicator(color: darkGrey));
                  },
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
