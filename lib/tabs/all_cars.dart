import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/cars_provider.dart';
import 'package:flutter_demo/widgets/car_list.dart';
import 'package:provider/provider.dart';

class AllCarsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CarsProvider>(
        builder: (context, cars, _) => cars.allCars.isNotEmpty
            ? CarList(
          cars: cars.allCars,
        )
            : Center(
          child: Text(
            'There are no cars',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
