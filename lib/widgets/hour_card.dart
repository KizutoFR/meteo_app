import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget hourCard(){
  return Container(
    width: 75,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),
      ),
      elevation: 5,
      child: Column(
        children: const [
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Text(
              "13"+" h",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child:Icon(
              Icons.cloud,color: Colors.black,size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "13"+" h",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
        ],
      ) ,
    )
  );
}