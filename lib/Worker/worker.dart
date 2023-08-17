// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:http/http.dart';
import 'dart:convert';

class worker {
  var location;
  var temp;
  var humidity;
  var air_speed;
  var description;
  var main;
  var icon;

  //constructor using named parameter
  worker({this.location}) {
    location = this.location;
  }

//method
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=acbb8264d5d87355890b5db9475ab94e"));
      Map data = jsonDecode(response.body);

      //Getting  temp,humidity
      Map temp_data = data['main'];
      double getTemp = temp_data['temp'] - 273.15;
      double getHumidity = temp_data['humidity'];
      // print(temp);

      //Getting Speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed'] / 0.27777778;
      print(getAir_speed);

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      String getIcon = weather_main_data['icon'];
      print(getIcon);
      // print(weather_data);
      // print(weather_main_data['main']);

      //Assigning value
      temp = getTemp;
      humidity = getHumidity;
      air_speed = getAir_speed;
      description = getDesc;
      main = getMain_des;
      icon = getIcon;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "03n";
      print("An error occurred: $e");
    }
  }
}

// worker loc = worker(location: "Mumbai");
// print(loc.temp);
