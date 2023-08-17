// ignore_for_file: prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:weatherapp/Activity/home.dart';
import 'package:weatherapp/Activity/loading.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
    "/": (context) => Loading(),
    "/home": (context) => Home(),
    "/loading": (context) => Loading()
  }));
}
