import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/custom_app_bar.dart';
import 'package:notes_app/components/custom_text_from_filed.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class EditViewItems extends StatelessWidget {
  const EditViewItems({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        icon: const Icon(Icons.check),
        onPressed: () {
          note.save();
          BlocProvider.of<NotesCubit>(context).fetchNotes();
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              CustomTextFromField(
                title: 'Title',
                text: note.title,
                onChange: (value) {
                  note.title = value!;
                },
              ),
              SizedBox(height: 20),
              CustomTextFromField(
                title: 'Content',
                text: note.subtitle,
                maxLines: 5,
                onChange: (value) {
                  note.subtitle = value!;
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
