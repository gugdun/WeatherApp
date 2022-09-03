import 'package:flutter/material.dart';
import 'package:weather_app/src/widgets/cities_list.dart';
import 'package:weather_app/src/widgets/search_field.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            SearchField(),
            CitiesList(),
          ],
        ),
      ),
    );
  }
}
