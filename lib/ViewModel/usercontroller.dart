import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class UserController extends ChangeNotifier {
  

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=11.1955&lon=76.2360&appid=729f0d2fa1807af056b91a8de3045da4&units=metric'));

    print(response.body);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonn = jsonDecode(body);

      // obj = UserModel.fromjson(jsonn);
    } else {
      print("Error Fetching Data");
    }
  }
}
