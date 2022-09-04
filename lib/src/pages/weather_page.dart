import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/cubit/forecast_cubit.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/widgets/pages/page_refresh.dart';
import 'package:weather_app/src/widgets/weather/current_forecast.dart';

class WeatherPage extends StatelessWidget {
  final City city;

  const WeatherPage({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForecastCubit>(
      create: (context) => ForecastCubit(city: city),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ForecastCubit, ForecastState>(
            builder: (context, state) {
              return PageRefresh(
                onRefresh: () => context.read<ForecastCubit>().refresh(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        city.city,
                        style: GoogleFonts.manrope(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: CurrentForecast(city: city),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
