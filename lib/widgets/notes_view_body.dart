import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 24, right: 24, bottom: 5),
      child: Column(
        children: [
          CustomAppBar(),
          // NoteSearchBar(),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
