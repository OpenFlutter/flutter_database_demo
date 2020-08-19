import 'dart:async';
import 'dart:io';
import 'package:flutter_demo/model/car.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String carsTable = 'cars_table';
  String colId = 'id';
  String colBrand = 'brand';
  String colType = 'type';
  String colStart = 'start';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'cars.db';

    var carsDatabase =
    await openDatabase(path, version: 1, onCreate: _createDb);
    return carsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $carsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colBrand TEXT, $colType TEXT, $colStart INTEGER)');
  }

  //  读取数据
  Future<List<Map<String, dynamic>>> getCarMapList() async {
    Database db = await this.database;
    var result = await db.query(carsTable);
    return result;
  }

  //  增加数据
  Future<int> insertCar(Car car) async {
    Database db = await this.database;
    var result = await db.insert(carsTable, car.toMap());
    return result;
  }

  //  刷新数据
  Future<int> updateCar(Car car) async {
    Database db = await this.database;
    var result = await db.update(carsTable, car.toMap(),
        where: '$colId = ?', whereArgs: [car.id]);
    return result;
  }

  //  删除数据
  Future<int> deleteCar(int id) async {
    Database db = await this.database;
    int result =
    await db.rawDelete('DELETE FROM $carsTable WHERE $colId = $id');
    return result;
  }

  //  获取数据条数
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT (*) FROM $carsTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // 转化获得 List 类型数据
  Future<List<Car>> getCarList() async {
    var carMapList = await getCarMapList();
    int count = carMapList.length;

    List<Car> carList = List<Car>();

    for (int i = 0; i < count; i++) {
      carList.add(Car.fromMapObject(carMapList[i]));
    }
    return carList;
  }
}
