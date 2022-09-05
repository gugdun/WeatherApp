import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/forecast_cubit.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/entities/forecast.dart';
import 'package:weather_app/src/widgets/weather/weather.dart';

class CurrentForecast extends StatelessWidget {
  final City city;

  const CurrentForecast({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastCubit, ForecastState>(
      builder: (context, state) {
        return FutureBuilder(
          future: context.read<ForecastCubit>().forecast,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              Forecast forecast = snapshot.data as Forecast;
              return Weather(weather: forecast.currentWeather);
            }
          },
        );
      },
    );
  }
}
