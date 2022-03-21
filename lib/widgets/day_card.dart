import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:meteo_app/models/forecast_weather.dart';

Widget dayCard(ListHours element) {

  
  String _formatToDegree(double? degree) {
    return (degree! - 273.15).round().toString() + "°";
  }

  String _formatDate(int? dt) {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dt! * 1000);

    if (DateTime(date.year, date.month, date.day) == tomorrow) {
      return "Tomorrow";
    }

    return DateFormat('EEEE').format(date);
  }


  return Column(
    children: [
      ListTile(
        leading: const Icon(
          Icons.cloud,
          color: Colors.white
        ),
        title: Text(_formatDate(element.dt), style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff353D65)),),
        trailing: Text("${_formatToDegree(element.main!.tempMin)} / ${_formatToDegree(element.main!.tempMax)}", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffA2ACCD))),
      ),
      const Divider(
        height: 2,
        indent: 15,
        endIndent: 15,
        color: Color.fromARGB(255, 179, 179, 179),
      )
    ],
  );
}