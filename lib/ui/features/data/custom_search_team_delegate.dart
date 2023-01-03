import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoring_7419/ui/features/data/team_page.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class CustomSearchTeamDelegate extends SearchDelegate {
  CustomSearchTeamDelegate({
    required this.teamList,
    required this.tournamentKey,
  });

// Demo list to show querying
  List<String> teamList;
  String tournamentKey;

  @override
  TextStyle? get searchFieldStyle => const TextStyle(color: black);

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear, color: Colors.red))
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
        onTap: () {
          close(context, null);
        },
        child: Image.asset("assets/icons/arrow_left_darkT.png"));
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = teamList.where((team) => team.substring(3, team.length).toLowerCase().startsWith(query.toLowerCase())).toList();
    return SearchListTile(matchQuery: matchQuery, tournamentKey: tournamentKey);
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = teamList.where((team) => team.substring(3, team.length).toLowerCase().startsWith(query.toLowerCase())).toList();
    return SearchListTile(matchQuery: matchQuery, tournamentKey: tournamentKey);
  }
}

class SearchListTile extends StatelessWidget {
  const SearchListTile({
    Key? key,
    required this.matchQuery,
    required this.tournamentKey,
  }) : super(key: key);
  final String tournamentKey;
  final List<String> matchQuery;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String team = matchQuery[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: darkGrey,
            child: Padding(padding: const EdgeInsets.fromLTRB(0, 0, 5, 4), child: Icon(FontAwesomeIcons.robot, color: white)),
          ),
          title: Text(team.substring(3, team.length)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamPage(teamNumber: int.parse(team.substring(3, team.length)), tournamentKey: tournamentKey),
              ),
            );
          },
        );
      },
    );
  }
}
