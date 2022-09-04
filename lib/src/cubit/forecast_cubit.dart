import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/entities/forecast.dart';
import 'package:weather_app/src/services/forecast_service.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final City city;
  final ForecastService forecastService = ForecastService();

  ForecastCubit({required this.city}) : super(ForecastInitial());

  Future<Forecast> get forecast async => forecastService.currentWeather(city);
}
