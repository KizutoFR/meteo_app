import 'package:flutter/material.dart';
import 'package:meteo_app/views/homepage.dart';
import 'package:meteo_app/widgets/drawer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Météo APP",
    home: homepage(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Météo APP',
        home: HomePage(city: ""),
      ),
      providers: [
        ChangeNotifierProvider<DrawerStateInfo>(
            create:(_) => DrawerStateInfo(),
        )
      ],
    );
  }
}