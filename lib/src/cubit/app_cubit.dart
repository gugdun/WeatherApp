import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/entities/city.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  Future<bool> loadApp() async {
    var prefs = await SharedPreferences.getInstance();
    var json = prefs.getString('cities');
    if (json != null) {
      var cities = jsonDecode(json).map<City>((e) => City.fromJson(e)).toList();
      emit(AppLoaded(cities: cities));
    } else {
      emit(AppLoaded());
    }
    return true;
  }

  Future<void> addCity(City city) async {
    var prefs = await SharedPreferences.getInstance();
    var newCities = (state as AppLoaded).cities.sublist(0);
    newCities.add(city);
    await prefs.setString('cities', jsonEncode(newCities));
    emit(AppLoaded(cities: newCities));
  }

  Future<void> removeCity(City city) async {
    var prefs = await SharedPreferences.getInstance();
    var newCities = (state as AppLoaded).cities.sublist(0);
    newCities.remove(newCities.firstWhere((e) => e.compareTo(city) == 1));
    await prefs.setString('cities', jsonEncode(newCities));
    await prefs.remove(jsonEncode(city.toJson()));
    emit(AppLoaded(cities: newCities));
  }
}
