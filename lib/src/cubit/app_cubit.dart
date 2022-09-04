import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/entities/city.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  late SharedPreferences prefs;

  AppCubit() : super(AppInitial());

  Future<bool> loadApp() async {
    prefs = await SharedPreferences.getInstance();
    var json = prefs.getString('cities');
    if (json != null) {
      var cities = jsonDecode(json).map<City>((e) => City.fromJson(e)).toList();
      emit(AppLoaded(cities: cities));
    } else {
      emit(AppLoaded());
    }
    return true;
  }

  void addCity(City city) {
    var newCities = (state as AppLoaded).cities.sublist(0);
    newCities.add(city);
    prefs.setString('cities', jsonEncode(newCities));
    emit(AppLoaded(cities: newCities));
  }

  void removeCity(City city) {
    var newCities = (state as AppLoaded).cities.sublist(0);
    newCities.remove(newCities.firstWhere((e) => e.compareTo(city) == 1));
    prefs.setString('cities', jsonEncode(newCities));
    emit(AppLoaded(cities: newCities));
  }
}
