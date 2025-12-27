// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesSuccess) {
            final notes = state.notes;
            
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(notes[index].key),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.red],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.delete, color: Colors.white, size: 30),
                  ),

                  confirmDismiss: (direction) async {
                    // Optional confirmation dialog
                    return true;
                  },

                  onDismissed: (direction) async {
                    var deletedNote = notes[index];
                    await notes[index].delete();
                    BlocProvider.of<NotesCubit>(context).getNotes();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Note deleted'),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () async {
                            await BlocProvider.of<AddNoteCubit>(
                              context,
                            ).addNote(deletedNote);
                            BlocProvider.of<NotesCubit>(context).getNotes();
                          },
                        ),
                      ),
                    );
                  },
                  child: NoteCard(note: notes[index]),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
