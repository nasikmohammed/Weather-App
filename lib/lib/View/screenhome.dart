import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_learning_3/ViewModel/provider.dart';
import 'package:weather_api_learning_3/Model/model.dart';

UserModel? obj;

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..tohidetextformfield

  bool _clicked = true;
  @override
  Widget build(BuildContext context) {
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>TodateFormat
    DateTime now = DateTime.now();
    String formatted = DateFormat('dd-MM-yyyy').format(now);
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    final provides = Provider.of<LocationProvider>(context);

    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<calling determind from LocationProvider to get Current Location2

    Provider.of<LocationProvider>(context).detemind();
    Provider.of<UserController>(context).fetchData();
    print(
        "{[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[object]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]}");
    print(obj?.wetherContition ??
        "......................................................................");
    String wallpaper = "assets/weather.webp";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
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
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              provides.currentPostion == null
                                  ? Text(
                                      "Weather",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>...Current Position

                                      provides.currentPostion.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                              const Text(
                                "HERE",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..tohidetextformfield
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 130),
              child: Column(
                children: [
                  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..tohidetextformfield
                  !_clicked
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20, right: 40),
                          child: Container(
                              height: 50, width: 500, child: TextFormField()),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 10,
                  ),
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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
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
              padding: const EdgeInsets.only(top: 490, left: 50),
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

                                  "${obj?.wetherContition}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.hourglass_full,
                              color: Color.fromARGB(255, 15, 158, 214),
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
                                      fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 90),
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
                                      "${obj?.lon}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 246, 245, 239),
                              size: 45,
                            ),
                            Column(
                              children: const [
                                Text(
                                  "Sunset",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "35°C",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
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
          ],
        ),
      ),
    ));
  }
}
//

//http://api.openweathermap.org/data/2.5/air_pollution?lat=11.2588&lon=75.7804&appid=729f0d2fa1807af056b91a8de3045da4