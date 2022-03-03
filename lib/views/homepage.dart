import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meteo_app/models/forecast_weather.dart';
import 'package:meteo_app/models/meteo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meteo_app/widgets/drawer.dart';
import 'package:meteo_app/services/meteo_service.dart';

class HomePage extends StatefulWidget {
  final String city;
  
  const HomePage({Key? key, required this.city}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _HomePageState(city);
  }
}

class _HomePageState extends State<HomePage> {
  String city;
  bool _haveCurrentCity = false;

  _HomePageState(this.city);

  @override
  void initState() {
    super.initState();
    _checkForCurrentCity();
  }

  _checkForCurrentCity() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cityName = prefs.getString('lastCity');
    setState(() {
      _haveCurrentCity = cityName != null;
    });

    if(_haveCurrentCity) {
      city = cityName as String;
      print("CurrentCity ${city}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Center(
        child: !_haveCurrentCity 
          ? Text("Veuillez choisir une ville dans le menu a gauche")
          : FutureBuilder(
            future: getCurrentWeather(city),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Text("Loading...");
              } else if(snapshot.connectionState == ConnectionState.done){
                return Text(snapshot.data.toString());
              } else {
                return Text("Erreur");
              }
            }
          )
      ),
      drawer: MyDrawer(currentPage: widget.city),
    );
  }
}