import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Test1"),
            const Text('test2'),
        ],)
      ),
    );
  }
}