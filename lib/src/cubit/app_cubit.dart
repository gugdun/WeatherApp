import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/entities/coordinates.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  void addPage(Coordinates page) {
    if (state is AppDefault) {
      var newPages = (state as AppDefault).pages;
      newPages.add(page);
      emit(AppDefault(pages: newPages));
    } else {
      emit(AppDefault(pages: <Coordinates>[page]));
    }
  }

  void removePage(Coordinates page) {
    var newPages = (state as AppDefault).pages;
    newPages.remove(newPages.firstWhere((e) => e.compareTo(page) == 1));
    if (newPages.isEmpty) {
      emit(AppInitial());
    } else {
      emit(AppDefault(pages: newPages));
    }
  }

  final PageController pageController = PageController(initialPage: 1);
}
