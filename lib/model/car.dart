import 'package:flutter/cupertino.dart';

class Car {
  int id;
  String brand;
  String type;
  bool start;

  Car({@required this.brand, this.type, this.start = false});
//
//  bool toggleCompleted() {
//    return !completed;
//  }

  // Convert a Task into a MAP Object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['brand'] = brand;
    map['type'] = type;
    map['start'] = start == true ? 1 : 0;
    return map;
  }

  //  Extract a Task from a MAP object
  Car.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.brand = map['brand'];
    this.type = map['type'];
    this.start = map['start'] == 1 ? true : false;
  }
}