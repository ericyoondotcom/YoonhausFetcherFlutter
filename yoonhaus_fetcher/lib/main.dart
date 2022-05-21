import 'package:flutter/material.dart';
import 'package:yoonhaus_fetcher/Home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yoonhaus Status",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Yoonhaus Status")
        ),
        body: Home()
      )
    );
  }
}