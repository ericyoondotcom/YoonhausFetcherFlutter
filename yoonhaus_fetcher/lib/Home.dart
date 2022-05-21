import 'package:flutter/material.dart';
import 'package:yoonhaus_fetcher/DeviceDisplay.dart';

class Home extends StatelessWidget {

  Future<void> refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {

      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            DeviceDisplay(
                deviceName: "Garage",
                deviceId: "250043001247343339383037",
                icon: Icons.house
            ),
            DeviceDisplay(
                deviceName: "Dryer",
                deviceId: "35002b000e47343432313031",
                icon: Icons.local_laundry_service
            )
          ]
      )
    );
  }
}