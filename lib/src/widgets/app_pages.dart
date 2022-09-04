import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/pages/search_page.dart';
import 'package:weather_app/src/pages/weather_page.dart';
import 'package:weather_app/src/widgets/page_indicator.dart';

class AppPages extends StatelessWidget {
  const AppPages({Key? key}) : super(key: key);

  List<WeatherPage> pages(AppState state) {
    if (state is AppDefault) {
      return state.cities
          .map<WeatherPage>((e) => WeatherPage(city: e))
          .toList();
    } else {
      return <WeatherPage>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (BuildContext context, AppState state) {
        return Column(
          children: [
            const PageIndicator(),
            Expanded(
              child: PageView(
                controller: context.read<AppCubit>().pageController,
                children: <Widget>[
                  const SearchPage(),
                  ...pages(state),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
