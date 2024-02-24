import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:weather_api_learning_3/Model/locationmodel.dart';
import 'package:weather_api_learning_3/Model/model.dart';
import 'package:weather_api_learning_3/View/screenhome.dart';
import 'package:weather_api_learning_3/ViewModel/provider.dart';

class currentlocPro extends ChangeNotifier {
  Future getCurentLocweather(location1, location2) async {
    print(location1);
    print(location2);
    print("laaaaatlongggggggggggggggggggg");
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$location1&lon=$location2&appid=729f0d2fa1807af056b91a8de3045da4&units=metric'));

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonD = jsonDecode(body);
      print(
          "ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
      print(jsonD);
      print("Dddddddddddddddddddddddddddddddddddddddddddddddddddddd");

      objj = LocatioinModel.fromjson(jsonD);
    } else {
      print("Datanotfetch");
      
    }
  }
}
