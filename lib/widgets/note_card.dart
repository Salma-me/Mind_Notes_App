import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_note_bottom_sheet.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => EditNoteBottomSheet(note: note),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          padding: EdgeInsets.only(top: 16.0, bottom: 16, left: 16),
          height: 210,
          decoration: BoxDecoration(
            color: Color(note.color!),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(fontSize: 28, color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                  child: Text(
                    note.subTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,

                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    note.isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () {
                    BlocProvider.of<NotesCubit>(context).togglePin(note);
                  },
                ),
                // trailing: IconButton(
                //   alignment: Alignment.bottomRight,
                //   onPressed: () async {
                //     await note.delete();
                //     BlocProvider.of<NotesCubit>(context).getNotes();
                //   },
                //   icon: const Icon(Icons.delete, color: Colors.black, size: 32),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, bottom: 8),
                child: Text(
                  note.date,
                  overflow: TextOverflow.clip,

                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
