class LocatioinModel {
  int? sunrise;
  int? sunset;
  double? tempmax;
  double? tempmin;
  String? name;
  LocatioinModel(
      {required this.sunrise,
      required this.sunset,
      required this.tempmax,
      required this.name});

  factory LocatioinModel.fromjson(Map<String, dynamic> json) {
    return LocatioinModel(
      tempmax: json["main"]["temp_max"],
      name: json["name"],
      sunrise: json["sys"]["sunrise"],
      sunset: json["sys"]["sunset"],
    );
  }
}
