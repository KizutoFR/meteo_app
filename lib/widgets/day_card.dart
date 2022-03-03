import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget dayCard() {
  return Column(
    children: const [
      ListTile(
        leading: Icon(
          Icons.cloud,
          color: Colors.white
        ),
        title: Text("Tomorrow", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff353D65)),),
        trailing: Text("13° / 11°", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffA2ACCD))),
      ),
      Divider(
        height: 2,
        indent: 15,
        endIndent: 15,
        color: Color.fromARGB(255, 179, 179, 179),
      )
    ],
  );
}