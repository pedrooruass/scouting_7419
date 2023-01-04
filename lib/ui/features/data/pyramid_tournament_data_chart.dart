// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// import '../../../application/models/data_model.dart';
// import '../../../application/providers/data_provider.dart';
//
// class PyramidTournamentDataChart extends StatefulWidget {
//   const PyramidTournamentDataChart({Key? key, required this.title, required this.indexSelected}) : super(key: key);
//   final indexSelected;
//   final String title;
//
//   @override
//   State<PyramidTournamentDataChart> createState() => _PyramidTournamentDataChart();
// }
//
// class _PyramidTournamentDataChart extends State<PyramidTournamentDataChart> {
//   late List<DataModel> _chartData;
//
//   @override
//   initState() {
//     _chartData = context.read<DataProvider>().ld;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<ChartData> chartData = [ChartData('7419', 1), ChartData('1378', 1), ChartData('114', 1), ChartData('1234', 1), ChartData('1234', 1), ChartData('1234', 1), ChartData('1234', 1), ChartData('1234', 1)];
//     return Consumer<DataProvider>(builder: (context, dataProvider, child) {
//       return SfPyramidChart(
//         title: ChartTitle(text: 'Comparison of calories'),
//         tooltipBehavior: TooltipBehavior(enable: true),
//         series: PyramidSeries<ChartData, String>(
//           dataSource: chartData,
//           xValueMapper: (ChartData data, _) => data.x,
//           yValueMapper: (ChartData data, _) => data.y,
//         ),
//       );
//     });
//   }
//
// // PyramidSeries<DataModel, String> _getPyramidSeries() {
// //   return PyramidSeries<DataModel, String>(
// //       dataSource: <DataModel>[],
// //       height: '90%',
// //       xValueMapper: (DataModel data, _) => data.teamNumber as String,
// //       yValueMapper: (DataModel data, _) => data.autoTotalPoints as double,
// //       dataLabelSettings: const DataLabelSettings(
// //         isVisible: true,
// //       ));
// // }
// }
//
// class ChartData {
//   ChartData(this.x, this.y);
//
//   final String x;
//   final double y;
// }
