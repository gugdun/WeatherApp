part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchQueried extends SearchState {
  final int futures;

  SearchQueried({required this.futures});
}

class SearchDone extends SearchState {
  final List<Coordinates> results;

  SearchDone({required this.results});
}
