// import 'package:flutter/cupertino.dart';
// import 'package:scoring_7419/application/models/second_row_model.dart';
//
// class SecondRowProvider extends ChangeNotifier {
//   SecondRowModel? _secondRowModel;
//
//   SecondRowModel? get secondRowModel => _secondRowModel;
//
//   set secondRowModel(SecondRowModel? secondRowModel) {
//     _secondRowModel = secondRowModel;
//     notifyListeners();
//   }
//
//   void changeAllianceColor() {
//     secondRowModel!.isAllianceBlue = !secondRowModel!.isAllianceBlue;
//     notifyListeners();
//   }
//
//   // Future<void> getMatchNumber(String matchNumber) async {
//   //   int teamNumber = int.tryParse(matchNumber) ?? 0;
//   //   if (teamNumber == 0) {
//   //     onError("Invalid team number");
//   //     return;
//   //   } // verify if it is a valid number
//   //   TeamRepository teamRepository = TeamRepository();
//   //   var result = await teamRepository.getTeamModel(teamNumber);
//   // }
//
//   void reset() {
//     secondRowModel = null;
//   }
// }
