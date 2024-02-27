import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_learning_3/Model/locationmodel.dart';
import 'package:weather_api_learning_3/View/screenhome.dart';
import 'package:weather_api_learning_3/ViewModel/Location.dart';
import 'package:http/http.dart' as http;

class LocationProvider with ChangeNotifier {
  LocationProvider() {
    getCurrentLocatiion().then((bb) {
      getCurentLocweather(lat, lon);
    });
    print("jjjjjjjjjj");
    print(lat);
    print(lon);
  }

  LocatioinModel? locationmoddel;
  double? lat;
  double? lon;
  Position? currentPostion;
  var local;
  Placemark placemark = Placemark();
  Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String?> getCurrentLocatiion() async {
    currentPostion = await determinePosition();

    lat = currentPostion!.latitude;
    lon = currentPostion!.longitude;

    print(lat);
    print(currentPostion);

    String? data = await geocodingg(currentPostion!);

    print(data);

    return data;
  }

  String? placee;
  Future<String?> geocodingg(
    Position position,
  ) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((value) {
      placemark = value[0];
      placee = placemark.locality;
    });
    return placee;
  }

  listen() {
    notifyListeners();
  }

  Future getCurentLocweather(location1, location2) async {
    print(location1);
    print(location2);
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$location1&lon=$location2&appid=729f0d2fa1807af056b91a8de3045da4&units=imperial'));

    if (response.statusCode == 200) {
      final body = response.body;
      print(body);
      final jsonD = jsonDecode(body);
      print(jsonD);
      locationmoddel = LocatioinModel.fromjson(jsonD);
      notifyListeners();
    } else {
      print("Datanotfetch");
    }
  }
}
