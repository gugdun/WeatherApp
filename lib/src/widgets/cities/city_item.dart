import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityItem extends StatelessWidget {
  const CityItem({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            text,
            style: GoogleFonts.manrope(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
