part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppDefault extends AppState {
  final List<ForecastPage> pages;

  AppDefault({this.pages = const <ForecastPage>[]});
}
