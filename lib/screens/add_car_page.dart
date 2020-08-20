import 'package:flutter/material.dart';
import 'package:flutter_demo/model/car.dart';
import 'package:flutter_demo/providers/cars_provider.dart';
import 'package:provider/provider.dart';


class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final carBrandController = TextEditingController();
  final carTypeController = TextEditingController();
  bool started = false;

  @override
  void dispose() {
    carBrandController.dispose();
    super.dispose();
  }

  void onAdd() {
    if (carBrandController.text.isNotEmpty && carTypeController.text.isNotEmpty ) {
      final Car car = Car(brand: carBrandController.text, type:carTypeController.text, start: started);
      Provider.of<CarsProvider>(context, listen: false).addCar(car);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Cars'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: carBrandController,
                  ),
                  TextField(
                    controller: carTypeController,
                  ),
                  CheckboxListTile(
                    value: started,
                    onChanged: (checked) {
                      setState(() {
                        started = checked;
                      });
                    },
                    title: Text('Start ?'),
                  ),
                  RaisedButton(
                    elevation: 5.0,
                    child: Text('Add'),
                    onPressed: onAdd,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}