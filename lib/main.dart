import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/places.dart';

bool showLoading = true;
void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      // We're using key value pairs on int other words map
      "/": (context) => showLoading ? Loading() : Home(),
      "/home": (context) => Home(),
      "/location": (context) => Location(),
    },
  ));
}
