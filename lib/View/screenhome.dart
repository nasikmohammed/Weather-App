import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_learning_3/Model/model.dart';
import 'package:weather_api_learning_3/ViewModel/provider.dart';
import 'package:weather_api_learning_3/ViewModel/usercontroller.dart';

UserModel? obj;

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  DateTime now = DateTime.now();
  String weatherwall = "assets/stock-photo-147213089.jpg";

  @override
  Widget build(BuildContext context) {
    final providder = Provider.of<UserController>(context);
    String formatted = DateFormat('dd/MM/yyyy \n   EEEE ').format(now);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    final controller = TextEditingController();
    final locc = Provider.of<LocationProvider>(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(weatherwall), fit: BoxFit.fitHeight)),
      child: Consumer<LocationProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 10),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
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
                                FutureBuilder(
                                    future: provider.getCurrentLocatiion(),
                                    builder: (context, snap) {
                                      Provider.of<UserController>(context)
                                          .fetchData();
                                      if (snap.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      return obj?.name == null
                                          ? Text(
                                              "${snap.data}",
                                              style: GoogleFonts.caveat(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            )
                                          : Text(
                                              "${obj?.name}",
                                              style: GoogleFonts.caveat(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            );
                                    })
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          cursorColor: const Color.fromARGB(255, 0, 0, 0),
                          decoration: InputDecoration(
                              hintText: "Enter Location...",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          controller: controller,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Text("Check Weather",
                          style: GoogleFonts.caveat(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      onPressed: () {
                        setState(() {
                          providder.textfieldvalue = controller.text;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 230, top: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(formatted,
                              style: GoogleFonts.caveat(
                                  color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 730, left: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.hourglass_full,
                              color: Color.fromARGB(255, 244, 169, 103),
                              size: 45,
                            ),
                            Column(
                              children: [
                                Text("TempMax",
                                    style: GoogleFonts.bungee(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 220, 121, 121))),
                                obj?.temp == null
                                    ? Text(
                                        "${locc.locationmoddel?.tempmax ?? "Loading..."}",
                                        style: GoogleFonts.caveat(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)))
                                    : Text("${obj?.temp}",
                                        style: GoogleFonts.caveat(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255))),
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
                              color: Color.fromARGB(255, 238, 237, 166),
                              size: 45,
                            ),
                            Column(
                              children: [
                                Text("Temp Min",
                                    style: GoogleFonts.bungee(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 220, 121, 121))),
                                obj?.temp == null
                                    ? Text(
                                        "${locc.locationmoddel?.tempmax ?? "Loading..."}",
                                        style: GoogleFonts.caveat(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)))
                                    : Text("${obj?.temp}",
                                        style: GoogleFonts.caveat(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      endIndent: 20,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.sunny,
                              color: Color.fromARGB(255, 238, 237, 166),
                              size: 45,
                            ),
                            Column(
                              children: [
                                Text("Sunrise",
                                    style: GoogleFonts.bungee(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 220, 121, 121))),
                                obj?.temp == null
                                    ? Text(
                                        "${locc.locationmoddel?.sunrise ?? "Loading..."}",
                                        style: GoogleFonts.caveat(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)))
                                    : Text("${obj?.sunrise}",
                                        style: GoogleFonts.caveat(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 246, 245, 239),
                          size: 40,
                        ),
                        Column(
                          children: [
                            Text("Sunset",
                                style: GoogleFonts.bungee(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 220, 121, 121))),
                            obj?.temp == null
                                ? Text(
                                    "${locc.locationmoddel?.sunset ?? 'Loading...'}",
                                    style: GoogleFonts.caveat(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)))
                                : Text("${obj?.sunset}",
                                    style: GoogleFonts.caveat(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    )));
  }
}
