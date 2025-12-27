import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  int noteColor = Color(0xffDCF2B0).toARGB32();

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      note.color ??= noteColor;
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      await notesBox.add(note);

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
