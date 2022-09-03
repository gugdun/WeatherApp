import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/search_cubit.dart';
import 'package:weather_app/src/widgets/search_item.dart';

class SearchList extends StatelessWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state is SearchDone ? state.results.length : 0,
          itemBuilder: (context, index) {
            if (state is SearchDone) {
              return SearchItem(city: state.results[index]);
            }
            return Container();
          },
        );
      },
    );
  }
}
