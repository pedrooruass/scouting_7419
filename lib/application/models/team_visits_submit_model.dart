class TeamVisitsSubmitModel {
  final String tournamentKey;
  final String scouterName;
  final int teamNumber;

  final String? programingQ1;
  final String? programingQ2;
  final String? programingQ3;
  final String? programingQ4;
  final String? programingQ5;
  final String? programingQ6;
  final String? programingQ7;
  final String? programingQ8;
  final String? programingExtra;

  final String? hardwareQ1;
  final String? hardwareQ2;
  final String? hardwareQ3;
  final String? hardwareQ4;
  final String? hardwareQ5;
  final String? hardwareQ6;
  final String? hardwareExtra;

  final String? businessQ1;
  final String? businessQ2;
  final String? businessQ3;
  final String? businessQ4;
  final String? businessQ5;
  final String? businessQ6;
  final String? businessQ7;
  final String? businessQ8;
  final String? businessExtra;

  TeamVisitsSubmitModel({
    required this.tournamentKey,
    required this.scouterName,
    required this.teamNumber,
    required this.programingQ1,
    required this.programingQ2,
    required this.programingQ3,
    required this.programingQ4,
    required this.programingQ5,
    required this.programingQ6,
    required this.programingQ7,
    required this.programingQ8,
    required this.programingExtra,
    required this.hardwareQ1,
    required this.hardwareQ2,
    required this.hardwareQ3,
    required this.hardwareQ4,
    required this.hardwareQ5,
    required this.hardwareQ6,
    required this.hardwareExtra,
    required this.businessQ1,
    required this.businessQ2,
    required this.businessQ3,
    required this.businessQ4,
    required this.businessQ5,
    required this.businessQ6,
    required this.businessQ7,
    required this.businessQ8,
    required this.businessExtra,
  });

  factory TeamVisitsSubmitModel.fromJson(Map<String, dynamic> json) {
    return TeamVisitsSubmitModel(
      tournamentKey: json['tournamentKey'],
      scouterName: json['scouterName'],
      teamNumber: json['teamNumber'],
      programingQ1: json['programingQ1'],
      programingQ2: json['programingQ2'],
      programingQ3: json['programingQ3'],
      programingQ4: json['programingQ4'],
      programingQ5: json['programingQ5'],
      programingQ6: json['programingQ6'],
      programingQ7: json['programingQ7'],
      programingQ8: json['programingQ8'],
      programingExtra: json['programingExtra'],
      hardwareQ1: json['hardwareQ1'],
      hardwareQ2: json['hardwareQ2'],
      hardwareQ3: json['hardwareQ3'],
      hardwareQ4: json['hardwareQ4'],
      hardwareQ5: json['hardwareQ5'],
      hardwareQ6: json['hardwareQ6'],
      hardwareExtra: json['hardwareExtra'],
      businessQ1: json['businessQ1'],
      businessQ2: json['businessQ2'],
      businessQ3: json['businessQ3'],
      businessQ4: json['businessQ4'],
      businessQ5: json['businessQ5'],
      businessQ6: json['businessQ6'],
      businessQ7: json['businessQ7'],
      businessQ8: json['businessQ8'],
      businessExtra: json['businessExtra'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tournamentKey': tournamentKey,
      'scouterName': scouterName,
      'teamNumber': teamNumber,
      'programingQ1': programingQ1,
      'programingQ2': programingQ2,
      'programingQ3': programingQ3,
      'programingQ4': programingQ4,
      'programingQ5': programingQ5,
      'programingQ6': programingQ6,
      'programingQ7': programingQ7,
      'programingQ8': programingQ8,
      'programingExtra': programingExtra,
      'hardwareQ1': hardwareQ1,
      'hardwareQ2': hardwareQ2,
      'hardwareQ3': hardwareQ3,
      'hardwareQ4': hardwareQ4,
      'hardwareQ5': hardwareQ5,
      'hardwareQ6': hardwareQ6,
      'hardwareExtra': hardwareExtra,
      'businessQ1': businessQ1,
      'businessQ2': businessQ2,
      'businessQ3': businessQ3,
      'businessQ4': businessQ4,
      'businessQ5': businessQ5,
      'businessQ6': businessQ6,
      'businessQ7': businessQ7,
      'businessQ8': businessQ8,
      'businessExtra': businessExtra,
    };
  }
}
