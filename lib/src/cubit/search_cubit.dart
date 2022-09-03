import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/entities/coordinates.dart';
import 'package:weather_app/src/services/geocoding_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> setQuery(String query) async {
    int futures = state is SearchQueried ? (state as SearchQueried).futures : 0;
    emit(SearchQueried(futures: futures + 1));
    Future.microtask(() async {
      var results = await GeocodingService().getCoordinates(query);
      int futures = (state as SearchQueried).futures;
      if (futures == 1) {
        if (query == '') {
          emit(SearchInitial());
        } else {
          emit(SearchDone(results: results));
        }
      } else {
        emit(SearchQueried(futures: futures - 1));
      }
    });
  }
}
