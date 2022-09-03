import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/cubit/search_cubit.dart';
import 'package:weather_app/src/widgets/app_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      themeMode: ThemeMode.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (BuildContext context) => AppCubit(),
          ),
          BlocProvider<SearchCubit>(
            create: (BuildContext context) => SearchCubit(),
          ),
        ],
        child: const AppPages(),
      ),
    );
  }
}
