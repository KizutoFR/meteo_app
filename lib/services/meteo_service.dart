import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meteo_app/models/forecast_weather.dart';
import 'package:meteo_app/models/meteo.dart';
import 'package:geocoding/geocoding.dart';

const apikey = 'd01be990c51591300af7620e6cc45221';

Future<Meteo> getCurrentWeather(String name) async {
  List<Location> coords = await locationFromAddress(name);
  Uri url = Uri.https("api.openweathermap.org", "/data/2.5/weather", 
    {
      'lat': coords[0].latitude.toString(), 
      'lon': coords[0].longitude.toString(), 
      'lang': 'fr',
      'appid': apikey
    }
  );
  var response = await http.get(url);
  if(response.statusCode == 200) {
    return Meteo.fromJson(jsonDecode(response.body));
  }
  return Future.error('No weather found for ${name}');
}

Future<ForecastWeather> getForecastWeather(String name) async {
  List<Location> coords = await locationFromAddress(name);
  Uri url = Uri.https("api.openweathermap.org", '/data/2.5/forecast',
    {
      'lat': coords[0].latitude.toString(), 
      'lon': coords[0].longitude.toString(), 
      'lang': 'fr',
      'appid': apikey
    }
  );
  var response = await http.get(url);
  if(response.statusCode == 200) {
    return ForecastWeather.fromJson(jsonDecode(response.body));
  }
  return Future.error('No forecast weather found for ${name}');
}