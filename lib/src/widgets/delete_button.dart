import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/app_cubit.dart';
import 'package:weather_app/src/entities/coordinates.dart';

class DeleteButton extends StatelessWidget {
  final Coordinates city;

  const DeleteButton({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<AppCubit>().removePage(city),
          child: const Icon(Icons.delete_outline),
        );
      },
    );
  }
}
