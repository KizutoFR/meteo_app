import 'package:flutter/material.dart';
import 'package:meteo_app/views/homepage.dart';
import 'package:meteo_app/widgets/slide_route_animation.dart';
import 'package:provider/provider.dart';
import 'package:meteo_app/database/database.dart';
import 'package:meteo_app/models/city.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerStateInfo with ChangeNotifier {
  int _currentDrawer = 0;
  int get getCurrentDrawer => _currentDrawer;

  void setCurrentDrawer(int drawer) {
    _currentDrawer = drawer;
    notifyListeners();
  }
}

class MyDrawer extends StatefulWidget {
  final String currentPage;
  
  const MyDrawer({Key? key, required this.currentPage}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MyDrawerState(currentPage);
  }
}

class MyDrawerState extends State<MyDrawer> {
  final String currentPage;
  final TextEditingController _newCityController = TextEditingController();

  var _tapPosition;
  List<City> _lists = [];

  MyDrawerState(this.currentPage);

  @override
  void initState() {
    super.initState();
    _tapPosition = const Offset(0.0, 0.0);
    _getCities();
  }

  void dispose() {
    _newCityController.dispose();
    super.dispose();
  }

  _getCities() async {
    var tmp = await MeteoDatabase.instance.cities();
    setState(() {
      _lists = tmp;
    });
  }

  _addNewCity() async {
    var newCity = await MeteoDatabase.instance.addCity(City(name: _newCityController.text));
    setState(() {
      _lists.add(newCity);
    });
  }

  _selectCity(name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastCity', name);
  }

  _deleteCity(index) async {
    await MeteoDatabase.instance.deleteCity(_lists[index].name);
    setState(() {
      _lists.removeAt(index);
    });
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  Future<void> _displayAddCityDialog(BuildContext context) async {
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new city'),
          content: TextField(
            controller: _newCityController,
            decoration: const InputDecoration(hintText: "Enter the name of the city here"),
          ),
          actions: <Widget>[
              ElevatedButton(
                child: Text('CANCEL'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: const Color(0xff353D65),
                  elevation: 0.0
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: Text('OK'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff353D65),
                ),
                onPressed: () {
                  setState(() {
                    _addNewCity();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
        );
      });
  }


  @override
  Widget build(BuildContext context) {
    var currentDrawer = Provider.of<DrawerStateInfo>(context, listen: false).getCurrentDrawer;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DrawerHeader(
            curve: Curves.bounceIn,
            decoration: const BoxDecoration(
               gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xffEFF0FF), Color(0xffC3D1FF)]
              ),
            ),
            child: Stack(
              children: [
                const Text('Meteo App',
                  style: TextStyle(
                    color: Color(0xff353D65),
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: 
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff353D65)
                        ),
                        onPressed: () => _displayAddCityDialog(context), 
                        child: const Text("Add new city")
                      )
                    )
                )
              ]
            )
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 10), 
            child: Text(
                "City history",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              )
          ),
          const Divider(
            height: 2,
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _lists.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  child: ListTile(
                    leading: const Icon(Icons.location_city_rounded), 
                    title: Text(
                      _lists[i].name,
                      style: currentDrawer == i
                          ? const TextStyle(fontWeight: FontWeight.bold)
                          : const TextStyle(fontWeight: FontWeight.normal),
                    ),
                    trailing: currentDrawer != i ? const Icon(Icons.arrow_forward_rounded) : null,
                    onTap: () {
                      _selectCity(_lists[i].name);
                      Navigator.of(context).pop();
                      if (currentDrawer == i) return;
                      Provider.of<DrawerStateInfo>(context, listen: false).setCurrentDrawer(i);
                      Navigator.of(context).pushReplacement(SlideRouteAnimation(page: HomePage(city: _lists[i].name)));
                    },
                  ),
                  onTapDown: _storePosition,
                  onLongPress: () async {
                    final RenderBox overlay = Overlay.of(context)?.context.findRenderObject() as RenderBox;
                    await showMenu(
                      position: RelativeRect.fromRect(
                        _tapPosition & Size(40, 40), // smaller rect, the touch area
                        Offset.zero & overlay.size // Bigger rect, the entire screen
                      ),
                      context: context, 
                      items: <PopupMenuEntry>[
                        PopupMenuItem(
                          onTap: () => _deleteCity(i),
                          value: true,
                          child: Row(
                            children: const <Widget>[
                              Icon(Icons.delete),
                              Text("Delete"),
                            ],
                          ),
                        )
                      ]
                    );
                  },
                );
              }
            ),
          )
        ],
      ),
    );
  }

}