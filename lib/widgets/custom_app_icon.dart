import 'package:flutter/material.dart';

class CustomAppIcon extends StatelessWidget {
  const CustomAppIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Column(
        children: [
          Image.asset('assets/images/logo.png', scale: 6),
          Text(
            "MindNotes",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
