import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/notes_item.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/cubits/cubit/notes_state.dart';

class ListViewItems extends StatelessWidget {
  const ListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesLoaded) {
          if (state.notes.isEmpty) {
            return const Center(
              child: Text('No Notes Yet', style: TextStyle(fontSize: 20)),
            );
          }

          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              return NotesItem(note: state.notes[index]);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
