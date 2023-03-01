import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../application/models/data_model.dart';
import '../../../application/providers/data_provider.dart';
import '../../themee/colors.dart';
import '../../themee/fonts.dart';

class SpecificTeamDataChart extends StatefulWidget {
  const SpecificTeamDataChart({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SpecificTeamDataChart> createState() => _SpecificTeamDataChartState();
}

class _SpecificTeamDataChartState extends State<SpecificTeamDataChart> {
  late List<DataModel> _chartData;

  @override
  initState() {
    _chartData = context.read<DataProvider>().ld;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, dataProvider, child) {
      // return SfCartesianChart(
      //   plotAreaBorderWidth: 1,
      //   enableSideBySideSeriesPlacement: false,
      //   title: ChartTitle(text: widget.title, textStyle: TextStyle(color: white, fontFamily: titleFont)),
      //   legend: Legend(isVisible: true, textStyle: TextStyle(color: white, fontFamily: titleFont), position: LegendPosition.bottom),
      //   // primaryXAxis: CategoryAxis(),
      //   primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift, interval: 2, majorGridLines: const MajorGridLines(width: 0)),
      //   primaryYAxis: NumericAxis(labelFormat: '{value}', axisLine: const AxisLine(width: 0), majorTickLines: const MajorTickLines(color: Colors.transparent)),
      //   // series: _getDefaultLineSeries(dataProvider, indexSelected: widget.indexSelected),
      //   tooltipBehavior: TooltipBehavior(enable: true),
      //
      // );
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
        name: 'S-Cones',
        dataSource: _chartData,
        xValueMapper: (DataModel teamData, _) => "Cones",
        color: orange,
        yValueMapper: (DataModel teamData, _) => double.parse(dataProvider.conesScored.toString()),
        dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 27, color: white, fontWeight: FontWeight.bold), labelAlignment: ChartDataLabelAlignment.middle),
      ),
      ColumnSeries<DataModel, String>(
        name: "S-Cubes",
        dataSource: _chartData,
        color: purple,
        xValueMapper: (DataModel teamData, _) => "Cubes",
        yValueMapper: (DataModel teamData, _) => double.parse(dataProvider.cubeScored.toString()),
        dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 27, color: white, fontWeight: FontWeight.bold), labelAlignment: ChartDataLabelAlignment.middle),
      ),
    ];
  }

// List<LineSeries<DataModel, num>> _getDefaultLineSeries(DataProvider dataProvider, {int indexSelected = 0}) {
//   return <LineSeries<DataModel, num>>[
//     LineSeries<DataModel, num>(
//       animationDuration: 2500,
//       dataSource: _chartData,
//       xValueMapper: (DataModel data, _) => data.matchNumber,
//       color: indexSelected == 0
//           ? autoColor
//           : indexSelected == 1
//               ? teleOpColor
//               : grey,
//       yValueMapper: (DataModel data, _) => indexSelected == 0
//           ? data.autoTotalPoints
//           : indexSelected == 1
//               ? data.teleOpTotalPoints
//               : 0,
//       width: 2,
//       name: (indexSelected == 0
//               ? '(Auto)'
//               : indexSelected == 1
//                   ? '(TeleOp)'
//                   : '') +
//           ' - Total Points',
//       markerSettings: const MarkerSettings(isVisible: true),
//     ),
//   ];
// }
}
