import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/entities/coordinates.dart';

class AddButton extends StatelessWidget {
  final Coordinates city;

  const AddButton({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<AppCubit>().addPage(city),
          child: const Icon(Icons.add),
        );
      },
    );
  }
}
