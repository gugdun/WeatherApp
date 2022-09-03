part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchQueried extends SearchState {
  final String query;

  SearchQueried({required this.query});
}

class SearchInProgress extends SearchState {
  final Future<void> future;

  SearchInProgress({required this.future});
}

class SearchDone extends SearchState {
  final List<Coordinates> results;

  SearchDone({required this.results});
}
