import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Colors.primaries.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                BlocProvider.of<AddNoteCubit>(context).selectedColor =
                    Colors.primaries[index];
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                radius: isSelected ? 30 : 25,
                backgroundColor: Colors.primaries[index],
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
