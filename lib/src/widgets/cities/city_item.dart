import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/entities/coordinates.dart';
import 'package:weather_app/src/widgets/location.dart';

class CityItem extends StatelessWidget {
  const CityItem({Key? key, required this.city}) : super(key: key);

  final Coordinates city;

  Widget deleteIcon() {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<AppCubit>().removePage(city),
          child: const Icon(Icons.delete_outline),
        );
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
              deleteIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
