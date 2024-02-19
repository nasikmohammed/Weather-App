import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:flutter_geocoder/services/base.dart';

import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_learning_3/Model/provider.dart';
import 'package:weather_api_learning_3/ViewModel/model.dart';

UserModel? obj;

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..tohidetextformfield
  final _locationController = TextEditingController();
  bool _clicked = true;
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>TodateFormat
    DateTime now = DateTime.now();
    String formatted = DateFormat('dd-MM-yyyy').format(now);
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    final provides = Provider.of<LocationProvider>(context);
    final proviiiders = Provider.of<UserController>(context);
    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<calling determind from LocationProvider to get Current Location2

    Provider.of<LocationProvider>(context).detemind();
    Provider.of<UserController>(context).fetchData();
    final objs = Provider.of<LocationProvider>(context);
    print("geooooooooooooooooooooooooooooo");
    final place2 = Provider.of<UserController>(context).geocodingg();

    // print(obj?.wetherContition ??
    //     "......................................................................");
    String wallpaper = "assets/weather.webp";
    String weatherwall = "assets/weatherr.avif";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(wallpaper), fit: BoxFit.fitHeight)),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 10),
                child: Container(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(place2.toString())

                                  // obj!.name
                                  // == null
                                  //     ? new CircularPercentIndicator(
                                  //         radius: 60.0,=
                                  //         lineWidth: 5.0,
                                  //         percent: 1.0,
                                  //         center: new Text("100%"),
                                  //         progressColor: Colors.green,
                                  //       )
                                  //     :
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..tohidetextformfield
                                    setState(() {
                                      _clicked = !_clicked;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.search_rounded,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 200),
                child: Column(
                  children: [
                    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..tohidetextformfield
                    !_clicked
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20, right: 40),
                            child: Container(
                              height: 50,
                              width: 500,
                              child: TextFormField(
                                controller: _locationController,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(_locationController.text),
                    Column(
                      children: [
                        const Icon(
                          Icons.sunny,
                          size: 150,
                          color: Colors.amber,
                        ),
                        //   Text(
                        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>obj is object of userModel
                        // obj!.lon.toString(),
                        //style:const TextStyle(fontSize: 20, color: Colors.white),
                        //  ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          formatted,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 550, left: 30),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.hourglass_full,
                                color: Colors.red,
                                size: 45,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "TempMax",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    //How to print model values in screenHome
                                    //1)create object of model in screenHome
                                    // 2)to display>>>obj.name
                                    //  "${obj?.wetherContition}",

                                    "${obj?.temp}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.hourglass_full,
                                color: Colors.amber,
                                size: 45,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Temp Min",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    "${obj?.temp}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25, right: 90),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.sunny,
                                    color: Color.fromARGB(255, 208, 206, 42),
                                    size: 45,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Sunrise",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Text(
                                        "${obj?.sunrise}",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 246, 245, 239),
                                size: 40,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Sunset",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    "${obj?.sunset}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 700, left: 200),
              //   child: GestureDetector(
              //     onTap: () async {
              //       final codinates = Coordinates(10.9778891, 76.2025966);
              //       var address = await Geocoder.local
              //           .findAddressesFromCoordinates(codinates);
              //       var first = address.first;

              //       print(first.featureName.toString());
              //     },
              //     child: Text("hi"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
//

//http://api.openweathermap.org/data/2.5/air_pollution?lat=11.2588&lon=75.7804&appid=729f0d2fa1807af056b91a8de3045da4
