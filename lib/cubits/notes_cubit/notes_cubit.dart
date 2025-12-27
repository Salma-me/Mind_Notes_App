import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    getNotes();
  }
  List<NoteModel>? notesList;
  String searchQuery = '';

  getNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notesList = notesBox.values.toList();
    emit(NotesSuccess(notes: notesList!));
  }

  void updateSearchQuery(String query) {
    searchQuery = query;
    applyFilters();
  }

  void togglePin(NoteModel note) async {
    note.isPinned = !note.isPinned;
    await note.save();

    applyFilters();
  }

  void applyFilters() {
    List<NoteModel> filteredNotesList = notesList!;

    // Filter by search query
    if (searchQuery.isNotEmpty) {
      filteredNotesList = filteredNotesList.where((note) {
        return note.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            note.subTitle.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    // Sort pinned first
    filteredNotesList.sort((firstNote, secondNote) {
      if (firstNote.isPinned && !secondNote.isPinned) return -1;
      if (!firstNote.isPinned && secondNote.isPinned) return 1;
      return 0;
    });

    emit(NotesSuccess(notes: filteredNotesList));
  }
}
