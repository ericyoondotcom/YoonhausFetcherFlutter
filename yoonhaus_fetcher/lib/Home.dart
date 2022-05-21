import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoonhaus_fetcher/DeviceDisplay.dart';

import 'DataManager.dart';
import 'main.dart';

class Device {
  Device({
    required this.name,
    required this.icon,
    required this.variable
  });

  String name;
  IconData icon;
  String variable;
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return RefreshIndicator(
          onRefresh: () {
            var dataManager = context.read<DataManager>();
            return dataManager.refreshAll();
          },
          child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                for (var id in MyApp.devices.keys)
                  DeviceDisplay(
                      deviceName: MyApp.devices[id]!.name,
                      deviceId: id,
                      icon: MyApp.devices[id]!.icon
                  )
              ]
          )
      );
  }
}