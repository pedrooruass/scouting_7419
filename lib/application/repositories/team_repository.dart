import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:scoring_7419/api_keys/api_keys.dart';
import 'package:scoring_7419/application/models/team_model.dart';

class TeamRepository {
  Future<Either<String, TeamModel>> getTeamModel(int teamNumber) async {
    var dio = Dio();
    dio.options.baseUrl = "https://www.thebluealliance.com/api/v3";
    dio.options.headers.putIfAbsent("X-TBA-Auth-Key", () => apiKey);
    try {
      var response = await dio.get("/team/frc$teamNumber");
      if (response.statusCode == HttpStatus.ok) return right(TeamModel.fromJson(response.data));
      if (response.statusCode == HttpStatus.notFound) return left("Team $teamNumber not found");
      return left("Error ${response.statusMessage}");
    } catch (e) {
      return left("There was an Error, Try again");
    }
  }
}
