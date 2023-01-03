import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/data_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../application/models/data_model.dart';
import '../../themee/colors.dart';
import '../../themee/fonts.dart';

class GeneralTeamDataChart extends StatefulWidget {
  const GeneralTeamDataChart({
    Key? key,
    required this.title,
    // required this.teamData,
    // required this.teamDataList,
  }) : super(key: key);
  final String title;

  // final TeamDataModel teamData;
  // final List<TeamDataModel> teamDataList;

  @override
  State<GeneralTeamDataChart> createState() => _GeneralTeamDataChartState();
}

class _GeneralTeamDataChartState extends State<GeneralTeamDataChart> {
  late List<DataModel> _chartData;

  @override
  initState() {
    _chartData = context.read<DataProvider>().ld;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, dataProvider, child) {
      return SfCartesianChart(
        plotAreaBorderWidth: 1,
        enableSideBySideSeriesPlacement: false,
        title: ChartTitle(text: widget.title, textStyle: TextStyle(color: white, fontFamily: titleFont)),
        legend: Legend(
          isVisible: true,
          textStyle: TextStyle(color: white, fontFamily: titleFont),
          position: LegendPosition.bottom,
        ),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(axisLine: const AxisLine(width: 0), labelFormat: '{value}', majorTickLines: const MajorTickLines(size: 0)),
        series: _getDefaultColumnSeries(dataProvider),
        tooltipBehavior: TooltipBehavior(enable: true),
      );
    });
  }

  List<ColumnSeries<DataModel, String>> _getDefaultColumnSeries(DataProvider dataProvider) {
    return <ColumnSeries<DataModel, String>>[
      ColumnSeries<DataModel, String>(
        name: 'Auto',
        dataSource: _chartData,
        xValueMapper: (DataModel teamData, _) => "AutoPoints",
        color: autoColor,
        yValueMapper: (DataModel teamData, _) => double.parse(dataProvider.averageAutonomousPoints.toString().substring(0, 3)),
        dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 25, color: white, fontWeight: FontWeight.bold), labelAlignment: ChartDataLabelAlignment.middle),
      ),
      ColumnSeries<DataModel, String>(
        name: "TeleOp",
        dataSource: _chartData,
        color: teleOpColor,
        xValueMapper: (DataModel teamData, _) => "TeleOp Points",
        yValueMapper: (DataModel teamData, _) => double.parse(dataProvider.averageTeleOpPoints.toString().substring(0, 3)),
        dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 27, color: white, fontWeight: FontWeight.bold), labelAlignment: ChartDataLabelAlignment.middle),
      ),
      ColumnSeries<DataModel, String>(
        name: "EndGame",
        dataSource: _chartData,
        color: endGameColor,
        xValueMapper: (DataModel teamData, _) => "EndGame Points",
        yValueMapper: (DataModel teamData, _) => double.parse(dataProvider.averageEndGamePoints.toString().substring(0, 3)),
        dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 27, color: white, fontWeight: FontWeight.bold), labelAlignment: ChartDataLabelAlignment.middle),
      ),
    ];
  }
}
