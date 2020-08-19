import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/cars_provider.dart';
import 'package:flutter_demo/screens/add_car_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static bool hasData = false;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<CarsProvider>(context).getCarList();

    if (Provider.of<CarsProvider>(context).count > 0) {
      HomePage.hasData = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddCarPage()));
            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(text: 'All'),
            Tab(text: 'UnReady'),
            Tab(text: 'Ready'),
          ],
        ),
      ),
      body: Provider.of<CarsProvider>(context).count > 0
          ? TabBarView(
        controller: tabController,
        children: <Widget>[
          AllTasksTab(),
          IncompleteTasksTab(),
          CompletedTasksTab()
        ],
      )
          : Center(
        child: Text(
          '',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
