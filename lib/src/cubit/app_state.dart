part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppDefault extends AppState {
  final List<Coordinates> pages;

  AppDefault({this.pages = const <Coordinates>[]});
}
