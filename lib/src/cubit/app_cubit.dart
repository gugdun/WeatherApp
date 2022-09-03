import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/entities/coordinates.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  Future<void> addPage(Coordinates page) async {
    if (state is AppDefault) {
      var newPages = (state as AppDefault).pages;
      newPages.add(page);
      emit(AppDefault(pages: newPages));
    } else {
      emit(AppDefault(pages: <Coordinates>[page]));
    }
  }

  final PageController pageController = PageController();
}
