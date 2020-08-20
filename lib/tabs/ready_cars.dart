import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/cars_provider.dart';
import 'package:flutter_demo/widgets/car_list.dart';
import 'package:provider/provider.dart';


class ReadyCarsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CarsProvider>(
        builder: (context, cars, _) => cars.startedCars.isNotEmpty
            ? CarList(
          cars: cars.startedCars,
        )
            : Center(
          child: Text(
            'There are no ready cars',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
