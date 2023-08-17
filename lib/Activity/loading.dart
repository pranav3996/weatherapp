// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String Temperature = "Loading";
  var city = "mumbai";
  var temp;
  var hum;
  var air_speed;
  var des;
  var main;
  var icon;

  Future<void> startApp(var city) async {
    worker loc = worker(location: city);
    await loc.getData();
    temp = loc.temp.toString();
    hum = loc.humidity.toString();
    air_speed = loc.air_speed.toString();
    des = loc.description;
    main = loc.main;
    icon = loc.icon.toString();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city
      });
    });
    // ignore: use_build_context_synchronously

    // print(loc.air_speed);
    // print(loc.description);

    // setState(() {
    //   Temperature = loc.temp.toString();
    //   print(loc.temp.toString());
    // });
  }

  @override
  void initState() {
    super.initState();
    //startApp();
  }

  @override
  Widget build(BuildContext context) {
    dynamic arg1 = ModalRoute.of(context)?.settings.arguments;
    Map<dynamic, dynamic> search = {};
    if (arg1 != null && arg1 is Map<dynamic, dynamic>) {
      search = arg1;
    }

    if (search.isNotEmpty) {
      city = search['searchText'];
    }
    startApp(city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 180,
              ),
              Image.asset("assets/image/icon.png", height: 240, width: 180),
              Text(
                "Weather App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Created by Pranav",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );

    // SafeArea(child: Text("LOADING")
    // child: Column(
    //   children: <Widget>[
    //     TextButton.icon(
    //       onPressed: () {
    //         Navigator.pushNamed(context, "/home");
    //       },
    //       icon: Icon(Icons.home),
    //       //label: Text(Temperature),
    //       label: Text("Loading"),
    //     )
    //   ],
    // ),
    //),
    //SafeArea(child: Text("Loading Activity")),
    //);
  }
}
