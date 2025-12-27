import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar_icon.dart';
import 'package:notes_app/widgets/notes_search_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        NoteSearchBar(),
        // CustomAppBarIcon(icon: icon, onPressed: onPressed),
      ],
    );
  }
}
