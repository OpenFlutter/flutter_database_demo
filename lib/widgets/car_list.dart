import 'package:flutter/material.dart';
import 'package:flutter_demo/model/car.dart';
import 'package:flutter_demo/widgets/car_list_item.dart';

class CarList extends StatelessWidget {
  final List<Car> cars;

  CarList({@required this.cars});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenCars(),
    );
  }

  List<CarListItem> getChildrenCars() {
    return cars
        .map((car) => CarListItem(
      car: car,
    ))
        .toList();
  }
}
