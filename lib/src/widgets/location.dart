import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/entities/coordinates.dart';

class Location extends StatelessWidget {
  const Location({Key? key, required this.city}) : super(key: key);

  final Coordinates city;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city.city,
          style: GoogleFonts.manrope(fontSize: 18),
        ),
        Text(
          '${city.admin}, ${city.country}',
          style: GoogleFonts.manrope(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ],
    );
  }
}
