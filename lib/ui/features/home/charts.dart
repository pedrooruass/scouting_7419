import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatefulWidget {
  const Charts({
    Key? key,
    required this.title,
    // required this.teamData,
    // required this.teamDataList,
  }) : super(key: key);
  final String title;

  // final TeamDataModel teamData;
  // final List<TeamDataModel> teamDataList;

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  late List<ExpenseData> _chartData;

  @override
  initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
        // text: context.read<TournamentProvider>().tournaments[0].name,
        text: widget.title,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: titleFont,
        ),
      ),
      // legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(),
      // series: <TeamDataModel>[
      //   for (var i = 0; i < widget.teamDataList.length; i++)
      //     LineSeries<TeamDataModel, String>(
      //       dataSource: teamDataModelList,
      //       xValueMapper: (ExpenseData data, _) => data.year,
      //       yValueMapper: (ExpenseData data, _) => data.expense,
      //       name: widget.teamDataList[i].team.name,
      //       color: widget.teamDataList[i].team.color,
      //     ),
      // ].toList(),
      series: <ChartSeries>[
        LineSeries<ExpenseData, String>(
          dataSource: _chartData,
          xValueMapper: (ExpenseData exp, _) => exp.expensiveCategory,
          yValueMapper: (ExpenseData exp, _) => exp.mother,
          name: 'Father',
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
        LineSeries<ExpenseData, String>(
          dataSource: _chartData,
          xValueMapper: (ExpenseData exp, _) => exp.expensiveCategory,
          yValueMapper: (ExpenseData exp, _) => exp.father,
          name: 'Mother',
          dataLabelSettings: DataLabelSettings(
              isVisible: true, color: white, borderColor: Colors.transparent),
        ),
        LineSeries<ExpenseData, String>(
          dataSource: _chartData,
          xValueMapper: (ExpenseData exp, _) => exp.expensiveCategory,
          yValueMapper: (ExpenseData exp, _) => exp.son,
          name: 'Son',
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
        LineSeries<ExpenseData, String>(
          dataSource: _chartData,
          xValueMapper: (ExpenseData exp, _) => exp.expensiveCategory,
          yValueMapper: (ExpenseData exp, _) => exp.daughter,
          name: 'Daughter',
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> expenseData = [
      ExpenseData(
        expensiveCategory: "Auto",
        father: 55,
        son: 40,
        mother: 45,
        daughter: 48,
      ),
      ExpenseData(
        expensiveCategory: "TeleOp",
        father: 75,
        son: 30,
        mother: 49,
        daughter: 81,
      ),
      ExpenseData(
        expensiveCategory: "EndGame",
        father: 105,
        son: 20,
        mother: 35,
        daughter: 34,
      ),
    ];

    return expenseData;
  }
}

class ExpenseData {
  final String expensiveCategory;
  final num father;
  final num son;
  final num mother;
  final num daughter;

  ExpenseData({
    required this.expensiveCategory,
    required this.father,
    required this.son,
    required this.mother,
    required this.daughter,
  });
}

/*
* Data:
*   - Tournaments List:
*       - Tournament Page:
*           - Tournament overview
*           - Teams Page:
*               - Team overview
* */
