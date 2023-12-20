import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DataManager.dart';

class DeviceDisplay extends StatefulWidget {
	final String deviceName;
	final String deviceId;
	final IconData icon;

	const DeviceDisplay({
		Key? key,
		required this.deviceName,
		required this.deviceId,
		required this.icon
	}) : super(key: key);

	@override
	_DeviceDisplayState createState() {
		return _DeviceDisplayState();
	}
}

class _DeviceDisplayState extends State<DeviceDisplay> {
	@override
	Widget build(BuildContext context) {
		return Consumer<DataManager>(
		builder: (context, dataManager, child) => Container(
			padding: EdgeInsets.all(15),
			child: Row(
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				Container(
					padding: EdgeInsets.only(right: 20),
					child: Icon(
						widget.icon,
						size: 30
					)
				),
				Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text(
						widget.deviceName,
						style: TextStyle(
							fontWeight: FontWeight.bold,
							fontSize: 20
						)
					),
					Text(
						dataManager.states[widget.deviceId] == null ? "Refresh to view state" : "${dataManager.states[widget.deviceId]}",
						style: TextStyle(
							fontSize: 17
						)
					)
				],
				)
			]
			)
		)
		);
	}
}