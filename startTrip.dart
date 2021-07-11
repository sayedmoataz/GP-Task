import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class staticVaribles {
  static var startTime;
  static var startLongitude;
  static var startLatitude;
}

class StartTrip extends StatelessWidget {
  // This widget is the root of your application.

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(title: Text("Location Services")),
            body: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(""),
                  ElevatedButton(
                      onPressed: () {
                        _getCurrentLocation();
                        staticVaribles.startTime = DateTime.now().second;
                      },
                      child: Text("Start Trip"))
                ],
              ),
            )));
  }
}
