class UserModel {
  double? lon;
  String?  wetherContition;
  double? temp;

  UserModel({required this.lon, required this.wetherContition, required this.temp});

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      lon: json["coord"]["lon"],
      //  pm10: json["list"][0]["components"]["pm10"]);
     wetherContition: json["weather"][0]["main"],
      temp: json["main"]["temp"],
    );
  }
}
