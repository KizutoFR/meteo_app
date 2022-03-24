import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meteo_app/models/forecast_weather.dart';
import 'package:meteo_app/models/meteo.dart';
import 'package:meteo_app/widgets/drawer.dart';
import 'package:meteo_app/services/meteo_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/hour_card.dart';
import '../widgets/day_card.dart';

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
    }
  }

  String _formatToDegree(double? degree) {
    return (degree! - 273.15).round().toString() + "°";
  }

  String formatToSunHour(int? timestamp) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(timestamp! * 1000);
    return date.hour.toString() + 'h' + date.minute.toString();
  }

  Widget getDayCards(List<ListHours> list) {
    List<Widget> tabs = [];
    list.asMap().forEach((int index, ListHours element) {
      final now = DateTime.now();
      DateTime date = DateTime.fromMillisecondsSinceEpoch(element.dt! * 1000);

      if (DateTime(date.year, date.month, date.day) != DateTime(now.year, now.month, now.day)) {
        if (index % 8 == 0) {
          tabs.add(dayCard(element));
        }
      }
    });
    tabs.add(dayCard(list[list.length - 1]));
    if(tabs.isNotEmpty) {
      return Column(children: tabs);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffEFF0FF), Color(0xffC3D1FF)])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              centerTitle: true,
              title: Text(widget.city,
                style: const TextStyle(
                  color: Color(0xff353D65),
                )
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: !_haveCurrentCity || city == '' 
              ? const Center(child: Text("Veuillez choisir une ville dans le menu à gauche"))
              : FutureBuilder<Meteo>(
                future: getCurrentWeather(city),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  } else if(snapshot.connectionState == ConnectionState.done && snapshot.data != null){
                    return Container (
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 170,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [Color(0xff5672FD), Color(0xff758AF6)])
                                    ),
                                    child: Row(    
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [   
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                children: [
                                                  const WidgetSpan(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(right:8.0),
                                                      child: Icon(Icons.cloud,
                                                          color: Color.fromARGB(166, 211, 209, 209), size: 24),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "${snapshot.data!.weather![0].main}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      height: 2,
                                                      fontSize: 20,
                                                    )
                                                  ),
                                                ],),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                  const WidgetSpan(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(right:8.0),
                                                      child: Icon(
                                                        Icons.flag,
                                                        color: Color.fromARGB(166, 211, 209, 209), 
                                                        size: 24
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "${snapshot.data!.wind!.speed} km/h",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      height: 2,
                                                      fontSize: 20,
                                                    )
                                                  ),],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    const WidgetSpan(
                                                      child: Padding(
                                                        padding: EdgeInsets.only(right:8.0),
                                                        child: Icon(
                                                          Icons.water,
                                                          color: Color.fromARGB(166, 211, 209, 209),
                                                          size: 24
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "${snapshot.data!.main!.humidity}% ",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        height: 2,
                                                        fontSize: 20,
                                                      )
                                                    ),
                                                  ],
                                                ),
                                              ),                                       
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:  [                                  
                                              Text(_formatToDegree(snapshot.data!.main!.temp),
                                                style:const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 75.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        const WidgetSpan(
                                                          child: Icon(
                                                            Icons.arrow_downward,
                                                            color: Color.fromARGB(131, 230, 229, 229),
                                                            size: 24
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: _formatToDegree(snapshot.data!.main!.tempMin),
                                                          style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        const WidgetSpan(
                                                          child: Icon(
                                                            Icons.arrow_upward,
                                                            color: Color.fromARGB(166, 211, 209, 209), 
                                                            size: 24
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: _formatToDegree(snapshot.data!.main!.tempMax),
                                                          style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25, top: 25, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Sun schedule",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff353D65)
                                        ),
                                      )
                                    ]
                                  ),
                                ),
                                SizedBox(
                                  height: 160,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        hourCard(context,formatToSunHour(snapshot.data!.sys!.sunrise),0xff7e92f7,Icons.wb_sunny_rounded),
                                        hourCard(context,formatToSunHour(snapshot.data!.sys!.sunset),0xff5b76fc,Icons.mode_night_rounded),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25, top: 25, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Next 5 days",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff353D65)
                                        ),
                                      )
                                    ]
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                    child: 
                                      FutureBuilder<ForecastWeather>(
                                        future: getForecastWeather(city),
                                        builder: (ctx, snap) {
                                          if(snap.connectionState == ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          } else if (snap.connectionState == ConnectionState.done) {
                                            return getDayCards(snap.data!.list!);
                                          } else {
                                            return const Text("Une erreur s'est produite");
                                          }                              
                                        }
                                      ),
                                  ),
                              ]
                            ),
                            ),
                          ),
                        ],
                      )
                  );
                  } else {
                    return const Center(child: Text("Une erreur s'est produite"));
                  }
                }
              ),
          drawer: MyDrawer(currentPage: widget.city),  
        )
      );
  }
}
