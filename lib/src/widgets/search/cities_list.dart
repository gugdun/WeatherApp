import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/widgets/search/city_item.dart';

class CitiesList extends StatelessWidget {
  const CitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state is AppLoaded ? state.cities.length : 0,
          itemBuilder: (context, index) {
            if (state is AppLoaded) {
              return CityItem(city: state.cities[index]);
            }
            return Container();
          },
        );
      },
    );
  }
}
