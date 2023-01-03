import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../application/models/data_model.dart';
import '../../../application/providers/data_provider.dart';
import '../../themee/colors.dart';
import '../../themee/fonts.dart';

class SpecificTeamDataChart extends StatefulWidget {
  const SpecificTeamDataChart({Key? key, required this.title, required this.indexSelected}) : super(key: key);
  final indexSelected;
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
      return SfCartesianChart(
        plotAreaBorderWidth: 1,
        enableSideBySideSeriesPlacement: false,
        title: ChartTitle(text: widget.title, textStyle: TextStyle(color: white, fontFamily: titleFont)),
        legend: Legend(isVisible: true, textStyle: TextStyle(color: white, fontFamily: titleFont), position: LegendPosition.bottom),
        // primaryXAxis: CategoryAxis(),
        primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift, interval: 2, majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(labelFormat: '{value}', axisLine: const AxisLine(width: 0), majorTickLines: const MajorTickLines(color: Colors.transparent)),
        series: _getDefaultLineSeries(dataProvider, indexSelected: widget.indexSelected),
        tooltipBehavior: TooltipBehavior(enable: true),
      );
    });
  }

  List<LineSeries<DataModel, num>> _getDefaultLineSeries(DataProvider dataProvider, {int indexSelected = 0}) {
    return <LineSeries<DataModel, num>>[
      LineSeries<DataModel, num>(
        animationDuration: 2500,
        dataSource: _chartData,
        xValueMapper: (DataModel data, _) => data.matchNumber,
        color: indexSelected == 0
            ? autoColor
            : indexSelected == 1
                ? teleOpColor
                : indexSelected == 2
                    ? endGameColor
                    : grey,
        yValueMapper: (DataModel data, _) => indexSelected == 0
            ? data.autoTotalPoints
            : indexSelected == 1
                ? data.teleOpTotalPoints
                : indexSelected == 2
                    ? data.endGameTotalPoints
                    : 0,
        width: 2,
        name: (indexSelected == 0
                ? '(Auto)'
                : indexSelected == 1
                    ? '(TeleOp)'
                    : indexSelected == 2
                        ? '(End Game)'
                        : '') +
            ' - Total Points',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
    ];
  }
}
