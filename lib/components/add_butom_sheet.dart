import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/add_note_form.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';

class AddBottomshet extends StatefulWidget {
  const AddBottomshet({super.key});

  @override
  State<AddBottomshet> createState() => _AddBottomshetState();
}

class _AddBottomshetState extends State<AddBottomshet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
          } else if (state is AddNoteFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),

              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
