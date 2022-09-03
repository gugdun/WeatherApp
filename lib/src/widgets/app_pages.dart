import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/screens/cities_screen.dart';
import 'package:weather_app/src/screens/weather_screen.dart';

class AppPages extends StatelessWidget {
  const AppPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (BuildContext context, AppState state) {
        return PageView(
          controller: context.read<AppCubit>().pageController,
          children: <Widget>[
            const CitiesScreen(),
            ...(state as AppDefault)
                .pages
                .map<WeatherScreen>((e) => WeatherScreen(city: e))
                .toList(),
          ],
        );
      },
    );
  }
}
