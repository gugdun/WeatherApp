import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/cubit/forecast_cubit.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/entities/forecast.dart';

class WeatherPage extends StatelessWidget {
  final City city;

  const WeatherPage({Key? key, required this.city}) : super(key: key);

  Widget currentForecast() {
    return BlocProvider(
      create: (context) => ForecastCubit(city: city),
      child: BlocBuilder<ForecastCubit, ForecastState>(
        builder: (context, state) {
          return FutureBuilder(
            future: context.read<ForecastCubit>().forecast,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading...');
              } else {
                Forecast forecast = snapshot.data as Forecast;
                return Text('${forecast.currentWeather.temperature} \u{B0}C');
              }
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  city.city,
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentForecast(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
