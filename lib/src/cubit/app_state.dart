part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoaded extends AppState {
  final List<City> cities;

  AppLoaded({this.cities = const <City>[]});
}
