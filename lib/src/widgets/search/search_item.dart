import 'package:flutter/material.dart';
import 'package:weather_app/src/entities/coordinates.dart';
import 'package:weather_app/src/widgets/location.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key, required this.city}) : super(key: key);

  final Coordinates city;

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
              const Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }
}
