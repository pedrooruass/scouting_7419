// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:scoring_7419/api_keys/api_keys.dart';
// import 'package:scoring_7419/application/models/team_model.dart';
// import 'package:scoring_7419/application/models/tournament_model.dart';

//!TODO NOT USING YET, this is what allows the api to find the tournaments by it self

// class TournamentRepository {
//   Future<Either<String, List<TournamentModel>>> getTournamentModels(
//     TeamModel teamModel,
//     int year,
//   ) async {
//     var dio = Dio();
//     dio.options.baseUrl = "https://www.thebluealliance.com/api/v3";
//     dio.options.headers.putIfAbsent("X-TBA-Auth-Key", () => apiKey);
//     try {
//       var response = await dio.get("/team/${teamModel.key}/events/$year/simple");
//       if (response.statusCode == HttpStatus.ok) {
//         List<TournamentModel> tournamentModels = [];
//         for (var tournament in response.data) {
//           tournamentModels.add(TournamentModel.fromJson(tournament));
//         }
//         return right(tournamentModels);
//       } // already change to individual tournament
//       return left("There was an Error, Try again!!!");
//     } catch (e) {
//       return left("There was an Error, Try again!!!");
//     }
//   }
// }
