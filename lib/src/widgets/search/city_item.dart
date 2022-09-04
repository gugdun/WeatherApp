import 'package:flutter/material.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/widgets/search/delete_button.dart';
import 'package:weather_app/src/widgets/search/location.dart';

class CityItem extends StatelessWidget {
  final City city;

  const CityItem({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Location(city: city),
              DeleteButton(city: city),
            ],
          ),
        ),
      ),
    );
  }
}
