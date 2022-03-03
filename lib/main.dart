import 'package:flutter/material.dart';
import 'package:meteo_app/views/homepage.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Météo APP",
    home: homepage(),
  ));
}
