import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/forecast_cubit.dart';
import 'package:weather_app/src/entities/coordinates.dart';
import 'package:weather_app/src/entities/forecast.dart';

class WeatherScreen extends StatelessWidget {
  final Coordinates city;

  const WeatherScreen({Key? key, required this.city}) : super(key: key);

  Widget forecast() {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(city.city),
            forecast(),
          ],
        ),
      ),
    );
  }
}
