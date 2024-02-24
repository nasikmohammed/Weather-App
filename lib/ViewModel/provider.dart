import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_api_learning_3/View/screenhome.dart';
import 'package:weather_api_learning_3/ViewModel/Location.dart';

class LocationProvider with ChangeNotifier {
  double? lat;
  double? lon;
  Position? currentPostion;
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
    print(currentPostion);

    String? data = await geocodingg(currentPostion!);
    print(data);
    currentlocPro loc = currentlocPro();

    loc.getCurentLocweather(lat, lon);

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
}
