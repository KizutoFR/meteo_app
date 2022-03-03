import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:meteo_app/models/city.dart';

class MeteoDatabase {
  static final MeteoDatabase instance = MeteoDatabase._init();

  static Database? _database; 

  MeteoDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('meteo_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('CREATE TABLE cities(name VARCHAR UNIQUE)');
  }

  Future<List<City>> cities() async {

    final db = await instance.database;

    final result = await db.query('cities');
  
    return result.map((city) => City(name: city['name'] as String)).toList();
  }

  Future<City> addCity(City city) async {
    final db = await instance.database;
    await db.insert('cities', city.toJson());

    return city;
  }

  Future<void> deleteCity(String name) async {
    final db = await instance.database;

    await db.delete('cities', where: 'name = ?', whereArgs: [name]);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}