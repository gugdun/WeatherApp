import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/services/geocoding_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GeocodingService geocoding = GeocodingService();

  SearchCubit() : super(SearchInitial());

  Future<void> setQuery(String query) async {
    if (state is SearchInProgress) {
      await (state as SearchInProgress).future;
    }
    if (query == '') {
      emit(SearchInitial());
      return;
    }
    emit(SearchQueried(query: query));
  }

  Future<void> search() async {
    if (state is SearchQueried) {
      var stateQueried = state as SearchQueried;
      var future = Future.microtask(() async {
        var results = await geocoding.getCoordinates(stateQueried.query);
        emit(SearchDone(results: results));
      });
      emit(SearchInProgress(future: future));
    }
  }
}
