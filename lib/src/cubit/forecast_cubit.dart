import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/src/entities/coordinates.dart';
import 'package:weather_app/src/entities/forecast.dart';
import 'package:weather_app/src/services/forecast_service.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final Coordinates city;
  final ForecastService forecastService = ForecastService();

  ForecastCubit({required this.city}) : super(ForecastInitial());

  Future<Forecast> get forecast async => forecastService.currentWeather(city);
}
