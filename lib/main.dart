import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_learning_3/ViewModel/Location.dart';
import 'package:weather_api_learning_3/ViewModel/provider.dart';
import 'package:weather_api_learning_3/View/screenhome.dart';

import 'ViewModel/usercontroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationProvider>(
          create: (context) {
            return LocationProvider();
          },
        ),
        ChangeNotifierProvider<UserController>(
          create: (context) {
            return UserController();
          },
        ),
        ChangeNotifierProvider<currentlocPro>(
          create: (context) {
            return currentlocPro();
          },
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.amber),
          home: ScreenHome()),
    );
    //  );
  }
}
