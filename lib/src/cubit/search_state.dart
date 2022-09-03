part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchQueried extends SearchState {
  final String query;

  SearchQueried({required this.query});
}
