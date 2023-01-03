import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:scoring_7419/api_keys/api_keys.dart';
import 'package:scoring_7419/application/models/tournament_model.dart';

// !TODO NOT USING YET, this is what allows the api to find the tournaments by it self

class TournamentRepository {
  Future<Either<String, List<TournamentModel>>> getTournamentModels(// TeamModel teamModel,
      // int year,
      ) async {
    var dio = Dio();
    dio.options.baseUrl = "https://www.thebluealliance.com/api/v3";
    dio.options.headers.putIfAbsent("X-TBA-Auth-Key", () => apiKey);
    try {
      var response =
          // await dio.get("/team/${teamModel.key}/events/$year/simple");
          // await dio.get("https://www.thebluealliance.com/api/v3/events/2023/simple"); // All tournaments in 2022
          await dio.get("https://www.thebluealliance.com/api/v3/team/frc7419/events/2023/simple"); // Just for 7419
      if (response.statusCode == HttpStatus.ok) {
        List<TournamentModel> tournamentModels = [];
        for (var tournament in response.data) {
          tournamentModels.add(TournamentModel.fromJson(tournament));
        }
        return right(tournamentModels);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        return left("There was an Error, Try again!!!");
      } // already change to individual tournament
    } catch (e) {
      return left("There was an Error, Try again!!!" + e.toString());
    }
  }

  Future<Either<String, List<String>>> getTeamModelInTournament(String eventKey) async {
    var dio = Dio();
    dio.options.baseUrl = "https://www.thebluealliance.com/api/v3";
    dio.options.headers.putIfAbsent("X-TBA-Auth-Key", () => apiKey);
    try {
      var response = await dio.get("/event/${eventKey}/teams/keys");
      if (response.statusCode == HttpStatus.ok) {
        List<String> tournamentKeys = [];
        for (var tournament in response.data) {
          tournamentKeys.add(tournament);
        }
        return right(tournamentKeys);
      }
      if (response.statusCode == HttpStatus.notFound) return left("Teams on $eventKey not found");
      return left("Error ${response.statusMessage}");
    } catch (e) {
      return left("There was an Error, Try again");
    }
  }
}

/*  The API returns this
 [
  "frc114",
  "frc1148",
  "frc1323",
  "frc1351",
  "frc1671",
  "frc1678",
  "frc2073",
  "frc2135",
  "frc2813",
  "frc299",
  "frc3859",
  "frc3970",
  "frc4159",
  "frc4255",
  "frc4698",
  "frc5026",
  "frc5104",
  "frc5419",
  "frc581",
  "frc5817",
  "frc5940",
  "frc6657",
  "frc7419",
  "frc841",
  "frc852",
  "frc8768",
  "frc971",
  "frc973"
]
*/
