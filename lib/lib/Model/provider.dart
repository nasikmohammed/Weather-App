import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_api_learning_3/View/screenhome.dart';
import 'package:weather_api_learning_3/ViewModel/model.dart';
import 'package:http/http.dart' as http;

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
    final current = currentPostion;
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    print(currentPostion);

    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    UserController obj = UserController();
    obj.fetchData();
  }
}

class UserController extends ChangeNotifier {
  List<UserModel> userList = [];

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=10.9778891&lon=76.2025966&appid=729f0d2fa1807af056b91a8de3045da4'));
    print(
        "111111111111111111111111111111111111111111111111111111111111111111111111111111111");
    print(response.body);
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonn = jsonDecode(body);
      print(
          "<><><><><><<><<><><<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<,,");
      print(jsonn);

    obj=  UserModel.fromjson(jsonn);

      // double pm10 = print(
      //     "jvhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");

      // for (var i in decodeData) {
      //   final model = UserModel.fromjson(i);
      //   print(model);
      //   // userList.add();
      //   print(userList);
      //   print(decodeData);
      // }
    } else {
      print("Error Fetching Data");
    }
  }
}
