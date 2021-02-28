//MAYBE FOR ANOTHER DAY :(
class Statistics {
  String region;
  String newCases;
  String activeCases;
  String recoveredCases;
  String deaths;

  Statistics(
      {this.region,
      this.newCases,
      this.activeCases,
      this.recoveredCases,
      this.deaths});

  factory Statistics.fromJson(dynamic json) {
    return Statistics(
      region: "${json['regions']}",
      newCases: "${json['new_cases']}",
      activeCases: "${json['active_cases']}",
      recoveredCases: "${json['recovered_cases']}",
      deaths: "${json['deaths']}",
    );
  }

  Map toJson() => {
        "regions": region,
        "new_cases": newCases,
        "active_cases": activeCases,
        "recovered_cases": recoveredCases,
        "deaths": deaths
      };
}
