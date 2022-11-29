import 'package:flutter/material.dart';
import 'package:scoring_7419/application/models/team_model.dart';
import 'package:scoring_7419/ui/features/data/team_page.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class CustomSearchTeamDelegate extends SearchDelegate {
  CustomSearchTeamDelegate({
    required this.teamList,
  });

// Demo list to show querying
  List<TeamModel> teamList;

  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(
        color: black,
      );

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Image.asset("assets/icons/arrow_left_darkT.png"),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<TeamModel> matchQuery = teamList
        .where(
          (tournament) =>
          tournament.name.toLowerCase().startsWith(query.toLowerCase()),
    )
        .toList();
    return SearchListTile(matchQuery: matchQuery);
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<TeamModel> matchQuery = teamList

        .where(
          (tournament) =>
          tournament.name.toLowerCase().startsWith(query.toLowerCase()),
    )
        .toList();
    return SearchListTile(matchQuery: matchQuery);
  }
}

class SearchListTile extends StatelessWidget {
  const SearchListTile({
    Key? key,
    required this.matchQuery,
  }) : super(key: key);

  final List<TeamModel> matchQuery;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        TeamModel team = matchQuery[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: darkGrey,
          ),
          title: Text(team.name),
          subtitle: Text("${team.country}, ${team.city}"),
          trailing: Text(
            team.teamNumber.toString(),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamPage(team: team),
              ),
            );
          },
        );
      },
    );
  }
}
