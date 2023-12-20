import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoonhaus_fetcher/secrets.dart';
import 'Home.dart';
import 'main.dart';

class DataManager extends ChangeNotifier {
	DataManager() :
		client = HttpClient(),
		decoder = Utf8Decoder();

		final states = new Map<String, String>();
		HttpClient client;
		Utf8Decoder decoder;

		Future<void> refreshAll() async {
			var futures = <Future>[];
			for(var id in MyApp.devices.keys) {
			futures.add(
				client.getUrl(Uri.parse("https://api.particle.io/v1/devices/${id}/${MyApp.devices[id]!.variable}?access_token=${token}"))
				.then((request) => request.close())
				.then((response) {
					response.transform(decoder).listen((data) {
						final parsed = jsonDecode(data);
						print(data);
						if(parsed.containsKey("error")) {
						states[id] = "<< Error response >>";
						} else if(parsed.containsKey("result")) {
						states[id] = parsed["result"];
						} else {
						states[id] = "<< Invalid response >>";
						}
						notifyListeners();
					});
				})
			);
		}
		await Future.wait(futures);
	}
}