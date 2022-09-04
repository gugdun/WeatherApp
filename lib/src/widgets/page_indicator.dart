import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (BuildContext context, AppState state) {
        if (state is AppInitial) {
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SmoothPageIndicator(
            controller: context.read<AppCubit>().pageController,
            count: (state as AppDefault).cities.length + 1,
            effect: const ScrollingDotsEffect(
              maxVisibleDots: 5,
              radius: 8,
              dotWidth: 8,
              dotHeight: 8,
            ),
          ),
        );
      },
    );
  }
}
