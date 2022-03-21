import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget hourCard(BuildContext context, String value, int color,IconData meteoicons){
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Container(
      width: (MediaQuery.of(context).size.width)/2-35,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Color(color),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child:Icon(
                meteoicons,color: Color.fromARGB(131, 255, 255, 255),size: 55,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ],
        ) ,
    ),
  );
}