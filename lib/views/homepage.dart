import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meteo_app/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  final String city;
  
  const HomePage({Key? key, required this.city}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _HomePageState(city);
  }
}

class _HomePageState extends State<HomePage> {
  final String city;

  _HomePageState(this.city);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(city, style: const TextStyle(color: Color(0xff353D65), fontWeight: FontWeight.bold))
      ),
      body: Center(
        child: Text(city)
      ),
      drawer: MyDrawer(currentPage: widget.city),
    );
  }
}