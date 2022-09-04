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
            create: (context) => AppCubit(),
            child: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) => current is AppInitial,
              builder: (context, state) {
                return FutureBuilder(
                  future: context.read<AppCubit>().loadApp(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const AppPages();
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
