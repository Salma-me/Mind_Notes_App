import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteBottomSheet extends StatelessWidget {
  const EditNoteBottomSheet({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: note.title,
    );
    TextEditingController subtitleController = TextEditingController(
      text: note.subTitle,
    );

    saveNote() async {
      note.title = titleController.text;
      note.subTitle = subtitleController.text;
      note.color = BlocProvider.of<AddNoteCubit>(context).noteColor;
      await note.save();
      BlocProvider.of<NotesCubit>(context).getNotes();
      Navigator.pop(context);
    }

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom == 0
            ? 32
            : MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              cursorColor: kPrimaryColor,
              style: TextStyle(color: kPrimaryColor),
              decoration: InputDecoration(
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder(color: kPrimaryColor),
                hintStyle: TextStyle(color: kPrimaryColor),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: subtitleController,
              contentPadding: EdgeInsets.symmetric(vertical: 64, horizontal: 8),
            ),
            SizedBox(height: 16),
            ColorsListView(),
            SizedBox(height: 16),
            CustomButton(text: 'Save', onTap: saveNote),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
