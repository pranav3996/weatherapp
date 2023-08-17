// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, unnecessary_new, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  // void timer() => {print("alarm is ringing")};

  // var username;
  // // Async Functions Start but return some delayed
  // // Future.delayed - Functions start after some

  // int counter = 1;
  // Future<void> getData() async {
  //   Response response = await get(Uri.parse(
  //       "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=acbb8264d5d87355890b5db9475ab94e"));
  //   Map data = jsonDecode(response.body);
  //   Map temp_data = data['main'];
  //   double temp = temp_data['temp'];
  //   print(temp);
  //   List weather_data = data['weather'];
  //   Map weather_main_data = weather_data[0];
  //   print(weather_data);
  //   print(weather_main_data['main']);
  // }
  // Future<void> getData() async {
  //   Response response = await get(
  //       Uri.parse("https://mocki.io/v1/85722191-ef9d-41f0-bc80-6415dcfef4d2"));

  //   if (response.statusCode == 200) {
  //     List<dynamic> dataList =
  //         jsonDecode(response.body); // Print the response body
  //     print(dataList);
  //   } else {
  //     print("Failed to fetch data: ${response.statusCode}");
  //   }
  // }
  /*Future<void> getData() async {
    await Future.delayed(Duration(seconds: 5), () {
      username = "Pranav";
    });
  }

  Future<void> showData() async {
    await getData();
    print("$username");
  }*/

  @override
  void initState() {
    super.initState();
    // getData(); //for api
    //showData();
    print("this is init state");
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("This is Set State");
  }

  // ignore: must_call_super
  @override
  void dispose() {
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    // dynamic arg = ModalRoute.of(context)?.settings.arguments;
    // Map<dynamic, dynamic> info = {};
    // if (arg != null && arg is Map<dynamic, dynamic>) {
    //   info = arg;
    //   print(info);
    //   // Now you can work with the 'info' map
    // } else {
    //   // Handle the case where arguments are not of the expected type or are null
    //   print("Invalid arguments type or null");
    // }

    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("Home Activity"),
    //     ),
    //     body: Column(
    //       children: [
    //         FloatingActionButton(
    //             onPressed: () => setState(() {
    //                   //counter += 1;
    //                 })),
    //         // Text("$counter")
    //         Text(info["temp_value"]),
    //         Text(info["air_speed"])
    //       ],
    //     ));
    // Color.fromARGB(255, 21, 101, 192),
    //     Color.fromRGBO(100, 181, 246, 1)

    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    dynamic arg = ModalRoute.of(context)?.settings.arguments;
    Map<dynamic, dynamic> info = {};
    if (arg != null && arg is Map<dynamic, dynamic>) {}
    info = arg;
    print(info);
    String temp = ((info['temp_value']).toString());
    String icon = info['icon_value'];
    String getCity = info['city_value'];
    String hum = info['hum_value'];
    String air = ((info['air_speed_value']).toString());
    if (temp == "NA") {
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 4);
    }

    print(air);
    String des = info['des_value'];

    print(icon);
    // Now you can work with the 'info' map
    // }
    if (arg != null && arg is Map<dynamic, dynamic>) {}
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue,
          )),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromRGBO(21, 101, 192, 1),
                  Color.fromRGBO(100, 181, 246, 1)
                ])),
            child: Column(
              children: [
                Container(
                  //Search Wala Container

                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": searchController.text,
                                });
                          }
                          //print(searchController.text);
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search $city"),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white.withOpacity(0.5)),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.all(26),
                          child: Row(children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$des",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "In $getCity",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ])),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/image/temp.png",
                            ),
                            //Icon(WeatherIcons.wiThermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$temp",
                                  style: TextStyle(fontSize: 50),
                                ),
                                Text(
                                  "C",
                                  style: TextStyle(fontSize: 30),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/image/wind.png",
                                ),
                                //Icon(WeatherIcons.wiDayWindy)
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$air",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text("km/hr")
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/image/hum.png",
                                ),
                                //Icon(WeatherIcons.wiHumidity)
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$hum",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By Pranav"),
                      Text("Data Provided By Openweathermap.org")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
