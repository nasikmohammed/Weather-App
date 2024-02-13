import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..tohidetextformfield
  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 70, left: 30),
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "DUBAI",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Good Morning",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..tohidetextformfield
                                  _clicked = !_clicked;
                                });
                              },
                              icon: Icon(
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
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.sunny,
                        size: 150,
                        color: Colors.amber,
                      ),
                      Text(
                        "35°C",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateTime.now().toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(
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
                            Icon(
                              Icons.hourglass_full,
                              color: Colors.red,
                              size: 45,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Temp Max",
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
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Icon(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 90),
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
                                Icon(
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
                                      "35°C",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 246, 245, 239),
                              size: 45,
                            ),
                            Column(
                              children: [
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
