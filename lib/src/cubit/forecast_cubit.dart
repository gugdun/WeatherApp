import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/entities/forecast.dart';
import 'package:weather_app/src/services/forecast_service.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final City city;
  final ForecastService forecastService = ForecastService();

  ForecastCubit({required this.city}) : super(ForecastInitial());

  Future<void> refresh() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(jsonEncode(city.toJson()));
    var uuid = const Uuid();
    emit(ForecastInitial(uuid: uuid.v1()));
  }

  Future<Forecast> get forecast async {
    var key = jsonEncode(city.toJson());
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      var json = prefs.getString(key);
      if (json != null) {
        return Forecast.fromJson(jsonDecode(json));
      }
    }
    var forecast = await forecastService.currentWeather(city);
    await prefs.setString(key, jsonEncode(forecast));
    return forecast;
  }
}
