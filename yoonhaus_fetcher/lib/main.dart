import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoonhaus_fetcher/Home.dart';

import 'DataManager.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final devices = <String, Device>{
    "250043001247343339383037": Device(
        name: "Garage",
        icon: Icons.house,
        variable: "GarageState"
    ),
    "35002b000e47343432313031": Device(
        name: "Dryer",
        icon: Icons.local_laundry_service,
        variable: "DryerState"
    )
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataManager(),
      child: MaterialApp(
        title: "Yoonhaus Status",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Yoonhaus Status")
          ),
          body: Home()
        )
      )
    );
  }
}