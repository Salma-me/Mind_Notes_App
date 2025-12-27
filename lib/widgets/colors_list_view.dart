import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  final List<Color> colorsList = const [
    Color(0xffDCF2B0),
    Color(0xffC2EABD),
    Color(0xffC0BABC),
    Color(0xffC7AC92),
    Color(0xffD29B90),
  ];

  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddNoteCubit>(context).noteColor =
        colorsList[selectedColorIndex].toARGB32();
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        // padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                selectedColorIndex = index;
                BlocProvider.of<AddNoteCubit>(context).noteColor =
                    colorsList[selectedColorIndex].toARGB32();
                setState(() {});
              },
              child: ColorItem(
                color: colorsList[index],
                isActive: selectedColorIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
