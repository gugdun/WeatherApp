import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/entities/city.dart';

class AddButton extends StatelessWidget {
  final City city;

  const AddButton({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<AppCubit>().addCity(city),
          child: const Icon(Icons.add),
        );
      },
    );
  }
}
