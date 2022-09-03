import 'package:flutter/material.dart';
import 'package:weather_app/src/entities/coordinates.dart';

class WeatherScreen extends StatelessWidget {
  final Coordinates city;

  const WeatherScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(city.city),
          ],
        ),
      ),
    );
  }
}
