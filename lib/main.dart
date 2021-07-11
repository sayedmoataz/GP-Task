import 'package:flutter/material.dart';
import 'package:flutter_application_1/startTrip.dart';
import 'home.dart';
import 'login.dart';
import 'signup.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Car Pooling App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Theme.of(context).accentColor,
      ),
      routes: {
        "/": (context) => Home(),
        "/login": (context) => Login(),
        "/signup": (context) => Signup(),
        "/starttrip": (context) => StartTrip()
      },
    );
  }
}
