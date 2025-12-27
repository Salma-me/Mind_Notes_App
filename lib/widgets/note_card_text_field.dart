import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

class NoteCardTextField extends StatefulWidget {
  const NoteCardTextField({super.key, required this.note, this.onSubmitted});
  final NoteModel note;
  final void Function(String)? onSubmitted;

  @override
  State<NoteCardTextField> createState() => _NoteCardTextFieldState();
}

class _NoteCardTextFieldState extends State<NoteCardTextField> {
  TextEditingController? controller = TextEditingController();
  bool isReadOnly = false;
  void unlockField() {
    setState(() {
      isReadOnly = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      onSubmitted: (value) {
        isReadOnly = true;
        widget.note.title = value;
        widget.note.save();
        setState(() {});
      },
      // hintText: note.title,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: widget.note.title,
        hintStyle: const TextStyle(fontSize: 32, color: Colors.black),
        suffix: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            isReadOnly = false;
            setState(() {});
          },
        ),
      ),
      style: const TextStyle(fontSize: 32, color: Colors.black),
    );
  }
}
