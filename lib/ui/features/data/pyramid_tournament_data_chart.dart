import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../application/models/data_model.dart';
import '../../../application/providers/data_provider.dart';

class PyramidTournamentDataChart extends StatefulWidget {
  const PyramidTournamentDataChart({Key? key, required this.title, required this.indexSelected}) : super(key: key);
  final indexSelected;
  final String title;

  @override
  State<PyramidTournamentDataChart> createState() => _PyramidTournamentDataChart();
}

class _PyramidTournamentDataChart extends State<PyramidTournamentDataChart> {
  late List<DataModel> _chartData;

  @override
  initState() {
    _chartData = context.read<DataProvider>().ld;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, dataProvider, child) {
      return SfPyramidChart(
        title: ChartTitle(text: 'Comparison of calories'),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: _getPyramidSeries(),
      );
    });
  }

  PyramidSeries<DataModel, String> _getPyramidSeries() {
    return PyramidSeries<DataModel, String>(
        dataSource: <DataModel>[],
        height: '90%',
        // explode: isCardView ? false : explode,
        // gapRatio: isCardView ? 0 : gapRatio,
        // pyramidMode: isCardView ? PyramidMode.linear : _selectedPyramidMode,
        xValueMapper: (DataModel data, _) => data.teamNumber as String,
        yValueMapper: (DataModel data, _) => data.autoTotalPoints as double,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
        ));
  }
}
