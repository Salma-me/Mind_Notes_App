import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class NoteSearchBar extends StatelessWidget {
  const NoteSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      // width: double.infinity,
      width: 200,
      child: TextField(
        onChanged: (value) {
          BlocProvider.of<NotesCubit>(context).updateSearchQuery(value);
        },
        decoration: InputDecoration(
          hintText: "Search notes...",
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
