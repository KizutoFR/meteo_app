import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/hour_card.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

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
                            "Bonjour Lucas", 
                            style: TextStyle(
                              color: Color(0xff353D65)
                            )
                          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column( 
          children:[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Stack(
                children: [
                  Positioned(child: Image.asset("assets/meteo-nuage-test.jpg"),left: 0, top:0,width: MediaQuery.of(context).size.width,),
                  SizedBox(
                    height: 200,
                    child:Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          
                           ListTile(
                            leading: Icon(Icons.cloud,color: Colors.white),
                            title: Text("Cloudy"
                                ),
                          ),

                           ListTile(
                            leading: Icon(Icons.flag,color: Colors.white),
                            title: Text("20km/h" 
                              ),
                          ),

                           ListTile(
                            leading: Icon(Icons.water ,color: Colors.white),
                            title: Text("Cloudy"
                                ),
                          ),
                          

                          
                          
                      ],),
                      Column(
                        children: [
                            const Text("15°",style: TextStyle(
                                fontSize: 100.0,
                                color: Colors.white,
                                letterSpacing: 0.7,
                              ), ),
                            Row(
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.arrow_downward ,color: Colors.white),
                                    Text("50%",style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      letterSpacing: 0.7,
                                    ), )
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.arrow_upward ,color: Colors.white),
                                    Text("50%",style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      letterSpacing: 0.7,
                                    ), )
                                  ],
                                ),
                            ],
                          )
                        ],
                      ),
                       
                    ],
                  )
                  ),
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: const[
                  Text("Leve de soleil"),
                  Text("Couché du soleil")
                ],
              )
            )
            
          ]
        ),
      )
    );
  }
}