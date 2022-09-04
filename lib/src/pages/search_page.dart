import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/search_cubit.dart';
import 'package:weather_app/src/widgets/search/cities_list.dart';
import 'package:weather_app/src/widgets/search/search_field.dart';
import 'package:weather_app/src/widgets/search/search_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const SearchField(),
                Expanded(
                  child: (state is SearchInitial)
                      ? const CitiesList()
                      : const SearchList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
