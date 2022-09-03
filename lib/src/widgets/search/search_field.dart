import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubit/search_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: GoogleFonts.manrope(fontSize: 18),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              hintStyle: GoogleFonts.manrope(fontSize: 18),
              hintText: 'Search city',
              border: const OutlineInputBorder(),
              suffixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) => context.read<SearchCubit>().setQuery(value),
            onSubmitted: (_) => context.read<SearchCubit>().search(),
          ),
        );
      },
    );
  }
}
