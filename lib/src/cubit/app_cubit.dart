import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/entities/city.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  void addCity(City city) {
    if (state is AppDefault) {
      var newCities = (state as AppDefault).cities;
      newCities.add(city);
      emit(AppDefault(cities: newCities));
    } else {
      emit(AppDefault(cities: <City>[city]));
    }
  }

  void removeCity(City city) {
    var newCities = (state as AppDefault).cities;
    newCities.remove(newCities.firstWhere((e) => e.compareTo(city) == 1));
    if (newCities.isEmpty) {
      emit(AppInitial());
    } else {
      emit(AppDefault(cities: newCities));
    }
  }
}
