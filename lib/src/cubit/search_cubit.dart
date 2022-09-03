import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void setQuery(String query) {
    if (query != '') {
      emit(SearchQueried(query: query));
    } else {
      emit(SearchInitial());
    }
  }
}
