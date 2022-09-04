import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/cubit/search_cubit.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/widgets/app_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (BuildContext context) {
              var app = AppCubit();
              app.addCity(City(
                city: 'Minsk',
                admin: 'Minsk City',
                country: 'Belarus',
                latitude: 53.9,
                longitude: 27.56667,
              ));
              app.addCity(City(
                city: 'New York',
                admin: 'New York',
                country: 'United States',
                latitude: 40.71427,
                longitude: -74.00597,
              ));
              return app;
            },
          ),
          BlocProvider<SearchCubit>(
            create: (BuildContext context) => SearchCubit(),
          ),
        ],
        child: const Scaffold(
          body: SafeArea(
            child: AppPages(),
          ),
        ),
      ),
    );
  }
}
