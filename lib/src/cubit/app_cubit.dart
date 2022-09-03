import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/models/forecast_page.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  Future<bool> addPage(String city) async {
    if (state is AppDefault) {
      var newPages = (state as AppDefault).pages;
      newPages.add(ForecastPage(city: 'Default'));
      emit(AppDefault(pages: newPages));
    } else {
      emit(AppDefault(
        pages: <ForecastPage>[
          ForecastPage(city: 'Default'),
        ],
      ));
    }
    return true;
  }

  final PageController pageController = PageController();
}
