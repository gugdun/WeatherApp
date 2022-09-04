import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Temperature extends StatelessWidget {
  final double temp;

  const Temperature({Key? key, required this.temp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$temp',
          style: GoogleFonts.barlowCondensed(fontSize: 120),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            '\xB0C',
            style: GoogleFonts.manrope(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
