import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsheets/gsheets.dart';
import 'package:scoring_7419/application/models/scoring_model.dart';

class ScoringRepository {
  final _credentials = r'''
{
  "type": "service_account",
  "project_id": "scoring-50753",
  "private_key_id": "03c4509e58f9f87770411e28f64929885e270ac3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCLR72lC7ewUanm\nQyo/+VgOMTQ2uGHJqoSePcJvl6inGT1hODOE6OfXpMNtUofnE/iypMvIz2JJBDFj\nEgaU1/OD6odPejlzHhuTNS/vWf7bkt28jVlIeq6RLV5LtJOloO8oBNFlawaLJ9Sw\ngBX0nmDupf3cBCuRG0E9/f77bK5s7cKMgyfyHNETE0shQJlc4ZFcVf3HrUXZYCC8\nQ+KhYBL/tNYdzwDwiwo5nCcTEAn7c7o+FVOUEM8SCL2FgFEgrANTGtePzfYUdlDL\na2x/4T+eD01pzuN2xj5LE51Obju4/lWHeohJ2A1OmBJ2c7A1ayKfGCH0yVnZqyCM\na6znHTF9AgMBAAECggEAQftHjVPCvoXBbjMtZccy/u4yZSXuNYJRd0Gcxg7bt+WO\nHWtphLJtesw0RKsPdNoSPFczrzsHvb19xAg7E/JGC51kYrNtWerOd2t//OzufojS\nAMwZmut7nY0Xmde/Bnz6L0QxCtGr9Op2qPLU8+C/3O7IF53mIcT+oGaej++JplI9\npwXJUTi20BiokKGchhtoX8G4Zls4HVwgxD6EdWW4vrsaK+wrBA4GbueiLdTZ/2SP\nEemDN8WKtEek6r0uGIAQEriwYn1L2/EjcI9E0OOUXiPiDGtbx8G2xiLlktSeztjz\nfkI3LfwaU0m2N5MNTrzjVKj0prGSPVCs0RRd8lAIBQKBgQC/D4ebvAjGF7kRz6M5\n4OK8IEIPEWeEZombT3R1v6FdXzNL7jzKZktLbI9hu7ZqeJ1kUDlK6ETZ3HMarlV9\nPOj5Ta0rjHlOKauAFwEWBPGe8izkqzj8OTrvPWtQbVS5G4pwnTBuEw3qykCWqFE3\nF/Uo4rBp+1NLaO7+l2ZgaKShFwKBgQC6nrhHEFrF5u66spKnCI7hBCfaOrle/eW7\ns9frswQPzhJ/Yklr9hFRmwYEXdB53jn6vu3gToRCPadvx+MxDPrqIywPpIac6Eke\nHdh2Y6W2V9O7AgoGHnzAQgcX/HtH5QBe/TDRYRp+WDYPaBwuxlpkwCeOrv5fY1QM\nPYW9XsRWiwKBgQCUq0zmTea13ffQeDWW7/r+UEuW1gAq8m7ZP3ZruXWi5lVQHE2J\nYRft1MetURecucYfLJ2oQBxzOisG8+jpzt+qPlslq+UogRxGS6A4thgdimyMcv+g\npBfL2YsLxkdK0rdi8a2huYn2zPJ9SPQJXscRzXNgxIQIBdsSmFS9aC/SeQKBgFrL\nT+KbLV6tfSZuLPWBL2qAiBcfjQKPSo8o73soDGjYHJ3HJuuUu1ZVsva64ev414KM\nE9WWvbgwoN68hGdf5k+1rwEpTajXRoOVh7QJxRzS3BtW4aOaf51WQndECoKvAqA0\nVOT5dldT+XFDeLq1HFN6PYSo1O95tvGBmSjKC4IDAoGAR9g0RRAj68SxMjTa/ZHO\n009qD4jNvZR1qhlbW4Vcy6ihW1ERxyXk2S9kjNqoFd9OpZhdsKy9Hpi6vcVl0Os7\nrr0zdbMHmyrtAt/Y2uhXDiqMhN2NR24BHlQiWoVO4WaFjug3msmlbvvnhFVpIrw5\nM6x5sx/fSa0HLCC76YNnWqA=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@scoring-50753.iam.gserviceaccount.com",
  "client_id": "101963075226417863111",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40scoring-50753.iam.gserviceaccount.com"
}
''';

  final _spreadSheetId = "1R0Il5LIjUnzXalyPzP2nz6uzG502k1iqacdwDc7sXjw";

  Future<bool> submitScoring(ScoringModel scoring) async {
    return _put(scoring.id, scoring.toJson());
  }

  Future<bool> _put(String id, Map<String, dynamic> map) async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('scoring');
    WriteBatch batch = FirebaseFirestore.instance.batch();
    batch.set(collectionReference.doc(id), map);
    await batch.commit();
    // submit google sheets
    //Init Gsheets
    final gsheets = GSheets(_credentials);
    final ss = await gsheets.spreadsheet(_spreadSheetId);
    final sheet = ss.worksheetByTitle('Sheet1');
    //update a cell
    await sheet!.values.appendRow(map.values.toList());
    return true;
  }

//  Read Data
  Stream<List<DataModel>> readScoringData() =>
      FirebaseFirestore.instance
          .collection("scoring")
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => DataModel.fromJson(doc.data())).toList());

  Stream<List<UserModel>> readUsersData() =>
      FirebaseFirestore.instance
          .collection("users")
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());

//  Read the data from a specific Team Number
  Stream<List<DataModel>> readTeamData(int teamNumber) =>
      FirebaseFirestore
          .instance
          .collection("scoring")
          .where("teamNumber", isEqualTo: teamNumber)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => DataModel.fromJson(doc.data())).toList());

//  Read the data from a specific Tournament
  Stream<List<DataModel>> readTournamentData(String tournament) =>
      FirebaseFirestore.instance
          .collection("scoring")
          .where("tournamentName", isEqualTo: tournament)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs
              .map((doc) => DataModel.fromJson(doc.data()))
              .toList());

  // Read the data of teams in a tournament
  Stream<List<DataModel>> readTeamsInTournamentData(int teamNumber,
      String tournament) =>
      FirebaseFirestore.instance
          .collection("scoring")
          .where("teamNumber", isEqualTo: teamNumber)
          .where("tournament", isEqualTo: tournament)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs
              .map((doc) => DataModel.fromJson(doc.data()))
              .toList());
}

class UserModel {
  final String id;
  final String name;
  final int age;
  final String birthday;

  UserModel({
    required this.id,
    required this.name,
    required this.age,
    required this.birthday,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        birthday: json["birthday"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "age": age,
        "birthday": birthday,
      };
}

class DataModel {
  final String? id;

  final String? tournamentName;
  final String? scouterName;
  final int teamNumber;
  final int matchNumber;
  final String? isAllianceBlue;

  // Autonomous
  final int autoUpperHubIn;
  final int autoLowerHubIn;
  final int autoUpperHubOut;
  final int autoLowerHubOut;
  final bool autoMovesOffTarmac;
  final int autoTotalPoints;

  // TeleOp
  final int teleOpUpperHubIn;
  final int teleOpLowerHubIn;
  final int teleOpUpperHubOut;
  final int teleOpLowerHubOut;
  final bool teleOpIsRobotDefensive;
  final int teleOpTotalPoints;

  // End Game
  final int endGameUpperHubIn;
  final int endGameLowerHubIn;
  final int endGameUpperHubOut;
  final int endGameLowerHubOut;
  final bool endGameIsRobotHanging;
  final bool endGameHaveScoreBonus;
  final bool endGameHaveHangerBonus;
  final int endGameTimeHanging;
  final int endGameHangerIndexSelected;
  final int endGameTotalPoints;

  final String? commentsAuto;
  final String? commentsTeleOp;
  final String? commentsEndGame;

  DataModel({
    required this.id,
    required this.tournamentName,
    required this.scouterName,
    required this.teamNumber,
    required this.matchNumber,
    required this.isAllianceBlue,
    required this.autoUpperHubIn,
    required this.autoLowerHubIn,
    required this.autoUpperHubOut,
    required this.autoLowerHubOut,
    required this.autoMovesOffTarmac,
    required this.autoTotalPoints,
    required this.teleOpUpperHubIn,
    required this.teleOpLowerHubIn,
    required this.teleOpUpperHubOut,
    required this.teleOpLowerHubOut,
    required this.teleOpIsRobotDefensive,
    required this.teleOpTotalPoints,
    required this.endGameUpperHubIn,
    required this.endGameLowerHubIn,
    required this.endGameUpperHubOut,
    required this.endGameLowerHubOut,
    required this.endGameIsRobotHanging,
    required this.endGameHaveScoreBonus,
    required this.endGameHaveHangerBonus,
    required this.endGameTimeHanging,
    required this.endGameHangerIndexSelected,
    required this.endGameTotalPoints,
    required this.commentsAuto,
    required this.commentsTeleOp,
    required this.commentsEndGame,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel(
        id: json["id"],
        tournamentName: json["tournamentName"] ?? "",
        scouterName: json["scouterName"] ?? "",
        teamNumber: json["teamNumber"],
        matchNumber: json["matchNumber"],
        isAllianceBlue: json["isAllianceBlue"] ?? "",
        autoUpperHubIn: json["autoUpperHubIn"],
        autoLowerHubIn: json["autoLowerHubIn"],
        autoUpperHubOut: json["autoUpperHubOut"],
        autoLowerHubOut: json["autoLowerHubOut"],
        autoMovesOffTarmac: json["autoMovesOffTarmac"],
        autoTotalPoints: json["autoTotalPoints"],
        teleOpUpperHubIn: json["teleOpUpperHubIn"],
        teleOpLowerHubIn: json["teleOpLowerHubIn"],
        teleOpUpperHubOut: json["teleOpUpperHubOut"],
        teleOpLowerHubOut: json["teleOpLowerHubOut"],
        teleOpIsRobotDefensive: json["teleOpIsRobotDefensive"],
        teleOpTotalPoints: json["teleOpTotalPoints"],
        endGameUpperHubIn: json["endGameUpperHubIn"],
        endGameLowerHubIn: json["endGameLowerHubIn"],
        endGameUpperHubOut: json["endGameUpperHubOut"],
        endGameLowerHubOut: json["endGameLowerHubOut"],
        endGameIsRobotHanging: json["endGameIsRobotHanging"],
        endGameHaveScoreBonus: json["endGameHaveScoreBonus"],
        endGameHaveHangerBonus: json["endGameHaveHangerBonus"],
        endGameTimeHanging: json["endGameTimeHanging"],
        endGameHangerIndexSelected: json["endGameHangerIndexSelected"],
        endGameTotalPoints: json["endGameTotalPoints"],
        commentsAuto: json["commentsAuto"] ?? "",
        commentsTeleOp: json["commentsTeleOp"] ?? "",
        commentsEndGame: json["commentsEndGame"] ?? "",
      );
}
