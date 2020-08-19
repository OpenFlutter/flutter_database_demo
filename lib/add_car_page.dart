import 'package:flutter/material.dart';

import 'model/car.dart';

class AddCarPage extends StatefulWidget {


  final Car car;
  final int carIndex;

  AddCarPage({Key key, this.car, this.carIndex}) : super(key: key);

  @override
  _AddCarPageState createState() {
    return _AddCarPageState();
  }
}

class _AddCarPageState extends State<AddCarPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Car 4S")),
    );
  }
}