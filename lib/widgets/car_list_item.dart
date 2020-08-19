import 'package:flutter/material.dart';
import 'package:flutter_demo/model/car.dart';
import 'package:flutter_demo/providers/cars_provider.dart';
import 'package:provider/provider.dart';

class CarListItem extends StatelessWidget {
  final Car car;

  CarListItem({@required this.car});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: car.start,
        onChanged: (bool checked) async {
          Provider.of<CarsProvider>(context, listen: false)
              .startCar(context, car);
        },
      ),
      title: Text(car.brand),
      trailing: IconButton(
        onPressed: () {
          Provider.of<CarsProvider>(context, listen: false)
              .deleteCar(context, car);
        },
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
