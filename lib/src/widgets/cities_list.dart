import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/widgets/city_item.dart';

class CitiesList extends StatelessWidget {
  const CitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state is AppDefault ? state.pages.length : 0,
          itemBuilder: (context, index) {
            if (state is AppDefault) {
              return CityItem(text: state.pages[index].city);
            }
            return Container();
          },
        );
      },
    );
  }
}
