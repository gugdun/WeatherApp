import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/widgets/pages/app_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      home: Scaffold(
        body: SafeArea(
          child: BlocProvider<AppCubit>(
            create: (context) {
              var app = AppCubit();
              app.loadApp();
              return app;
            },
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                if (state is AppLoaded) {
                  return const AppPages();
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
