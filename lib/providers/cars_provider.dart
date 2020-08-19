import 'package:flutter/foundation.dart';
import 'package:flutter_demo/db/database_helper.dart';
import 'package:flutter_demo/model/car.dart';
import 'dart:collection';
import 'package:sqflite/sqflite.dart';

import 'package:flutter/material.dart';

class CarsProvider with ChangeNotifier {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Car> _cars;
  int _count = 0;

  UnmodifiableListView<Car> get allCars => UnmodifiableListView(_cars);

  UnmodifiableListView<Car> get unStartedCars =>
      UnmodifiableListView(_cars.where((car) => car.start == false));

  UnmodifiableListView<Car> get startedCars =>
      UnmodifiableListView(_cars.where((car) => car.start == true));

  void getCarList() {
    final Future<Database> dbFuture = _databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Car>> carListFuture = _databaseHelper.getCarList();
      carListFuture.then((carList) {
        this._cars = carList;
        this._count = carList.length;
        notifyListeners();
      });
    });
  }

  int get count => _count;

  void addCar(Car car) async {
    int result;
    if (car.id != null) {
      result = await _databaseHelper.updateCar(car);
    } else {
      result = await _databaseHelper.insertCar(car);
    }
    if (result != 0) {
      print('Success');
    } else {
      print('Failed');
    }
    notifyListeners();
  }

  void startCar(BuildContext context, Car car) async {
    car.start = !car.start;
    int result = await _databaseHelper.updateCar(car);

    if (result != 0 && car.start == true) {
      _showSnackBar(context, '${car.brand} + ${car.type} + Completed');
    }
    notifyListeners();
  }

  void deleteCar(BuildContext context, Car car) async {
    if (car.id == null) {
      _showSnackBar(context, 'No Car was deleted');
      return;
    }

    int result = await _databaseHelper.deleteCar(car.id);
    if (result != 0) {
      _showSnackBar(context, 'Car Deleted Successfully');
    } else {
      _showSnackBar(context, 'Error Occurred while deleting note');
    }
    notifyListeners();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
