import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          print('Failed');
        } else if (state is AddNoteSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddNoteLoading ? true : false,
          // inAsyncCall: true,
          child: SingleChildScrollView(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 32,
                bottom: MediaQuery.of(context).viewInsets.bottom == 0
                    ? 32
                    : MediaQuery.of(context).viewInsets.bottom,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: AddNoteForm(),
            ),
          ),
        );
      },
    );
  }
}
