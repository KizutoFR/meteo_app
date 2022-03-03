import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/hour_card.dart';
import '../widgets/day_card.dart';

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
                )
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Container (
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xff5672FD), Color(0xff758AF6)])
                            ),
                            child: Row(    
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [   
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: EdgeInsets.only(right:8.0),
                                              child: Icon(Icons.cloud,
                                                  color: Color.fromARGB(166, 211, 209, 209), size: 24),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Cloudy ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              height: 2,
                                              fontSize: 20,
                                            )
                                          ),
                                        ],),
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: EdgeInsets.only(right:8.0),
                                              child: Icon(
                                                Icons.flag,
                                                color: Color.fromARGB(166, 211, 209, 209), 
                                                size: 24
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "20 km/h",
                                            style: TextStyle(
                                              color: Colors.white,
                                              height: 2,
                                              fontSize: 20,
                                            )
                                          ),],
                                        ),
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Padding(
                                                padding: EdgeInsets.only(right:8.0),
                                                child: Icon(
                                                  Icons.water,
                                                  color: Color.fromARGB(166, 211, 209, 209),
                                                  size: 24
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text: "50% ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                height: 2,
                                                fontSize: 20,
                                              )
                                            ),
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
                                      const Text("15"+"°",
                                        style:TextStyle(
                                          color: Colors.white,
                                          fontSize: 75.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: const TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Icon(
                                                    Icons.arrow_downward,
                                                    color: Color.fromARGB(131, 230, 229, 229),
                                                    size: 24
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "12°",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  )
                                                ),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: const TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Icon(
                                                    Icons.arrow_upward,
                                                    color: Color.fromARGB(166, 211, 209, 209), 
                                                    size: 24
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "18°",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  )
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 160,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                hourCard(context,0xff7e92f7,Icons.wb_sunny_rounded),
                                hourCard(context,0xff5b76fc,Icons.mode_night_rounded),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 25, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Next 5 days",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff353D65)
                                ),
                              )
                            ]
                          ),
                        ),
                        IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                dayCard(),
                                dayCard(),
                                dayCard(),
                                dayCard(),
                                dayCard(),
                              ],
                            ),
                          ),
                        ),
                      ]
                    ),
                    ),
                  ),
                ],
              )
          )  
        )
      );
  }
}
