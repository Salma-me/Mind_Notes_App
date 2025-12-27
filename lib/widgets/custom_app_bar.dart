import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_icon.dart';
import 'package:notes_app/widgets/notes_search_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppIcon(),
        NoteSearchBar(),
        // CustomAppBarIcon(icon: icon, onPressed: onPressed),
      ],
    );
  }
}
