import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_api_learning_3/View/screenhome.dart';
import 'package:weather_api_learning_3/ViewModel/model.dart';
import 'package:http/http.dart' as http;

double? lat;
double? lon;

class LocationProvider with ChangeNotifier {
  Position? currentPostion;
  Position? get _currentPosition => _currentPosition;
  Future detemind() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _currentPosition;

      null;
      notifyListeners();
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        currentPostion = null;
        notifyListeners();
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      currentPostion = null;
      notifyListeners();
      return;
    }
    currentPostion = await Geolocator.getCurrentPosition();
    // final current = currentPostion;
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    print(currentPostion);
    lat = currentPostion!.latitude;
    lon = currentPostion!.longitude;
    print("0000000000000000000000000000000000000000000");
    print(currentPostion);
    UserController obj = UserController();
    obj.fetchData();
  }
}

class UserController extends ChangeNotifier {
  List<UserModel> userList = [];

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=11.1955&lon=76.2360&appid=729f0d2fa1807af056b91a8de3045da4&units=metric'));
    print(
        "responseBODY>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(response.body);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonn = jsonDecode(body);

      obj = UserModel.fromjson(jsonn);
    } else {
      print("Error Fetching Data");
    }
  }

 Future<String> geocodingg() async {
    print("=====================================");
    // print(position.latitude);
    // print(position.longitude);
    List<Placemark> placemarks = await placemarkFromCoordinates(lat!, lon!);
    print(lat);
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<68888888888<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    final placee = placemarks[0].locality;
    print(placee);
    print(
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    return placee.toString();
  }
}
