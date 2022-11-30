// !TODO NOT USING YET, this is what allows the api to find the tournaments by it self

class TournamentModel {
  final String city;
  final String country;
  final String key;
  final String name;
  final String state_prov;
  final int year;

  TournamentModel({
    required this.city,
    required this.country,
    required this.key,
    required this.name,
    required this.state_prov,
    required this.year,
  });

  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    return TournamentModel(
      city: json['city'],
      country: json['country'],
      key: json['key'],
      name: json['name'],
      state_prov: json['state_prov'],
      year: json['year'],
    );
  }
}
