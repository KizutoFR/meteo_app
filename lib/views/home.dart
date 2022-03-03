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
                colors: [Color(0xffEFF0FF), Color(0xffC3D1FF)])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text("Lyon",
                  style: TextStyle(
                    color: Color(0xff353D65),
                  )),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage("assets/meteo-nuage-test.jpg"),
                      // ),
                      gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff5672FD), Color(0xff758AF6)])
                    ),
                  ),
                  SingleChildScrollView(
                    
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                       children: [
                        Row(
                          
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.cloud,
                                              color: Color.fromARGB(255, 211, 209, 209), size: 26),
                                        ),
                                        TextSpan(
                                            text: "Cloudy ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              height: 2,
                                              fontSize: 20,
                                            )),
                                      ],
                                    ),
                                  ),

                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.flag,
                                              color: Color.fromARGB(255, 211, 209, 209), size: 20),
                                        ),
                                        TextSpan(
                                            text: "20km/h",
                                            style: TextStyle(
                                              color: Colors.white,
                                              height: 2,
                                              fontSize: 20,
                                            )),
                                      ],
                                    ),
                                  ),

                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding: EdgeInsets.only(right:8.0),
                                            child: Icon(Icons.water,
                                                color: Color.fromARGB(255, 211, 209, 209), size: 20),
                                          ),
                                        ),
                                        TextSpan(
                                            text: "50% ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              height: 2,
                                              fontSize: 20,
                                            )),
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
                                  
                                  const Text("15"+"°",style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 75.0,
                                    fontWeight: FontWeight.bold,
                                  ), ),
                                  Row(
                                    children: [
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.arrow_downward,
                                              color: Color.fromARGB(255, 211, 209, 209), size: 26),
                                        ),
                                        TextSpan(
                                            text: "12 ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 26,
                                            )),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.arrow_upward,
                                              color: Color.fromARGB(255, 211, 209, 209), size: 26),
                                        ),
                                        TextSpan(
                                            text: "18 ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 26,
                                            )),
                                      ],
                                    ),
                                  ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  
                  Padding(
              padding: const EdgeInsets.only(top: 250),
              child:
                  ListView(
                    scrollDirection: Axis.horizontal,
                      children: [
                        hourCard(),
                        hourCard(),
                        hourCard(),
                        hourCard(),
                        hourCard(),
                    ],
                    )
                  )
                  
                ])
                )
           
                
                
              ));
  }
}
