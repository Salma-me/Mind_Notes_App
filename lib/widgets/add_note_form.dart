import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  addNote() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      String formattedDate = DateFormat('MMMM d, yyyy').format(DateTime.now());
      NoteModel note = NoteModel(
        title: title!,
        subTitle: subTitle!,
        date: formattedDate,
        isPinned: false,
      );
      await BlocProvider.of<AddNoteCubit>(context).addNote(note);
      BlocProvider.of<NotesCubit>(context).getNotes();
      // Navigator.pop(context);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            contentPadding: EdgeInsets.symmetric(vertical: 64, horizontal: 8),
            hintText: 'Content',
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 20),
          ColorsListView(),
          const SizedBox(height: 20),
          CustomButton(text: 'Add', onTap: addNote),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
