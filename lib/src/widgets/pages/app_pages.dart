import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/pages/search_page.dart';
import 'package:weather_app/src/pages/weather_page.dart';
import 'package:weather_app/src/widgets/pages/page_indicator.dart';

class AppPages extends StatefulWidget {
  const AppPages({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppPagesState();
}

class _AppPagesState extends State<AppPages> {
  final PageController _controller = PageController(
    initialPage: 1,
    keepPage: false,
  );

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<WeatherPage> weatherPages(AppState state) {
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
            PageIndicator(controller: _controller),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: (state is AppDefault) ? state.cities.length + 1 : 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SearchPage();
                  }
                  if (state is AppDefault &&
                      index - 1 >= 0 &&
                      index - 1 < state.cities.length) {
                    return WeatherPage(city: state.cities[index - 1]);
                  }
                  return Container();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
