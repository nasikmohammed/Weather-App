import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:weather_api_learning_3/ViewModel/model.dart';

import '../View/screenhome.dart';

class UserController extends ChangeNotifier {
  String textfieldvalue = "";
  Future fetchData(lat, lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$textfieldvalue&appid=729f0d2fa1807af056b91a8de3045da4'
        // 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=729f0d2fa1807af056b91a8de3045da4&units=metric'
        ));

    print(response.body);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonn = jsonDecode(body);

      print(jsonn);
      print(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><jsonnnnnn>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

      obj = UserModel.fromjson(jsonn);
    } else {
      print("Error Fetching Data");
    }
  }
}

//citynameAPI
//https://api.openweathermap.org/data/2.5/weather?q=chennai&appid=729f0d2fa1807af056b91a8de3045da4