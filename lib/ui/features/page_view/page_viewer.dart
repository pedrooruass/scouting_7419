import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/features/data/tournaments_page.dart';
import 'package:scoring_7419/ui/features/home/home_page.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class PageViewer extends StatefulWidget {
  const PageViewer({Key? key}) : super(key: key);

  @override
  _PageViewerState createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  final _controller = PageController(initialPage: 1);
  var heart = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          const TournamentsPage(),
          const HomePage(),
          const TestDataPage(),
          // inDevelopmentScreen(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _controller,
        flat: true,
        useActiveColorByDefault: false,
        color: grey,
        itemColor: black,
        items: const [
          RollingBottomBarItem(
            Icons.data_saver_off,
            label: 'Data',
            activeColor: darkGrey,
          ),
          RollingBottomBarItem(
            Icons.sports_basketball,
            label: 'Scout',
            activeColor: darkGrey,
          ),
          RollingBottomBarItem(
            FontAwesomeIcons.doorOpen,
            label: 'Visits',
            activeColor: darkGrey,
          ),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }

  Container inDevelopmentScreen() => Container(
        color: black,
        child: Center(
          child: Text(
            "In Development",
            style: TextStyle(
              color: white,
              fontSize: 18,
              fontFamily: titleFont,
            ),
          ),
        ),
      );
}

class TestDataPage extends StatefulWidget {
  const TestDataPage({Key? key}) : super(key: key);

  @override
  State<TestDataPage> createState() => _TestDataPageState();
}

class _TestDataPageState extends State<TestDataPage> {
  List<String> scoringIds = [];
  List<String> tournaments = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((doc) {
          print(doc.id);
        }));
  }

  // Get tournaments //Not working yet
  getTournaments() {
    FirebaseFirestore.instance.collection('scoring').get().then((snapshot) => snapshot.docs.forEach((doc) {
          print(doc.id);
          tournaments.add(doc.id);
        }));
  }

  @override
  void initState() {
    TournamentProvider().getTournamentModels();
    scoringIds = []; // Try to reset the list
    getDocIds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/icons/arrow_left.png"),
        ),
        title: AutoSizeText(
          "Test Data Page",
          maxLines: 1,
          minFontSize: 12,
          style: TextStyle(
            fontSize: 32,
            fontFamily: titleFont,
            color: Colors.white,
          ),
        ),
      ),
      // body: FutureBuilder(
      //   future: getDocIds(),
      //   builder: (context, snapshot) {
      //     while (!snapshot.hasData) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     return ListView.separated(
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           title: Text(scoringIds[index]),
      //         );
      //       },
      //       separatorBuilder: (context, index) {
      //         return const Divider();
      //       },
      //       itemCount: scoringIds.length,
      //     );
      //   },
      // ),
      // body: StreamBuilder<List<DataModel>>(
      //   stream: DataRepository().startListenTeamDataInTournament(teamNumber: 7419, tournamentKey: "2022mttd"),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text(snapshot.error.toString()),
      //       );
      //     } else if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: snapshot.data!.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             title: Text(snapshot.data![index].scouterName!),
      //             subtitle: Text(snapshot.data![index].teamNumber.toString()),
      //           );
      //         },
      //       );
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}

// fazer uma pesquisa de todos os torneios e colocar em uma lista, dentro de cada torneio fazer
// a pesquisa dos times e dos dados do torneio e colocar em outra lista.
// pegar os dados dos times e colocar na pagina do time analizando os dados
