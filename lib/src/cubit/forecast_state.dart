part of 'forecast_cubit.dart';

@immutable
abstract class ForecastState {}

class ForecastInitial extends ForecastState {
  final String uuid;

  ForecastInitial({this.uuid = ''});
}
