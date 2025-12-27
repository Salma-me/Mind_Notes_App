import 'package:flutter/material.dart';

class CustomNoNotesWidget extends StatelessWidget {
  const CustomNoNotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.note_alt_outlined, size: 48, color: Colors.grey),
          const SizedBox(height: 12),
          Text(
            'Create your first note',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
