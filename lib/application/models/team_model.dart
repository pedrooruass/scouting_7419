class TeamModel {
  final String key;
  final String city;
  final String country;
  final String name;
  final int teamNumber;

  TeamModel({
    required this.key,
    required this.city,
    required this.country,
    required this.name,
    required this.teamNumber,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      key: json['key'],
      city: json['city'],
      country: json['country'],
      name: json['name'],
      teamNumber: json['team_number'],
    );
  }
}
