import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/hour_card.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffEFF0FF), Color(0xffC3D1FF)]
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
                            "Lyon", 
                            style: TextStyle(
                              color: Color(0xff353D65),
                            )
                          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20),),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:AssetImage("assets/meteo-nuage-test.jpg"),
                    ),
                  ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    
                    ListTile(
                      leading: Icon(Icons.cloud,color: Colors.white),
                      title: Text("Cloudy"),
                    ),

                    ListTile(
                      leading: Icon(Icons.flag,color: Colors.white),
                      title: Text("20km/h"),
                    ),

                    ListTile(
                      leading: Icon(Icons.water ,color: Colors.white),
                      title: Text("Cloudy"),
                    ),
                  ],
                ),
              ),
              
            ]
          )
        )
      )

    );
  }
}