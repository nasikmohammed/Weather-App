class UserModel {
  double? lon;
  String? wetherContition;
  double? temp;
  String? name;
  int? sunrise;
  int? sunset;
  UserModel(
      {required this.lon,
      required this.wetherContition,
      required this.temp,
      required this.name,
      required this.sunrise,
      required this.sunset});

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      lon: json["coord"]["lon"],
      wetherContition: json["weather"][0]["main"],
      temp: json["main"]["temp_max"],
      name: json["name"],
      sunrise: json["sys"]["sunrise"],
      sunset: json["sys"]["sunset"],
    );
  }
}
