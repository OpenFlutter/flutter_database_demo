import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/cars_provider.dart';
import 'package:provider/provider.dart';

class AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CarsProvider>(
        builder: (context, cars, _) => cars.allCars.isNotEmpty
            ? Car(
          tasks: todos.allTasks,
        )
            : Center(
          child: Text(
            'There are no tasks',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
