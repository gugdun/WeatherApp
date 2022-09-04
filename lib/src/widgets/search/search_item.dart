import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/widgets/search/add_button.dart';
import 'package:weather_app/src/widgets/search/delete_button.dart';
import 'package:weather_app/src/widgets/search/location.dart';

class SearchItem extends StatelessWidget {
  final City city;

  const SearchItem({Key? key, required this.city}) : super(key: key);

  Widget button() {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppDefault) {
          return state.cities.where((e) => e.compareTo(city) == 1).isNotEmpty
              ? DeleteButton(city: city)
              : AddButton(city: city);
        } else {
          return AddButton(city: city);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Location(city: city),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}
