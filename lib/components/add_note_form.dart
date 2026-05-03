import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/color_list_view.dart';
import 'package:notes_app/components/custom_butom.dart';
import 'package:notes_app/components/custom_text_from_filed.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

// ignore: camel_case_types
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomTextFromField(
            title: title ?? 'Title',
            onSaved: (value) {
              title = value;
            },
            text: title ?? 'Title',
          ),
          const SizedBox(height: 20),
          CustomTextFromField(
            title: content ?? 'Content',
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
            text: content ?? 'Content',
          ),
          const SizedBox(height: 20),
          ColorListView(),
          const SizedBox(height: 20),
          CustomButom(
            isLoading: context.watch<AddNoteCubit>().state is AddNoteLoading,
            title: 'Add',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var currentdate = DateTime.now();
                var formattedDate =
                    "${currentdate.day}/${currentdate.month}/${currentdate.year} ${currentdate.hour}:${currentdate.minute}";
                var note = NoteModel(
                  title: title!,
                  subtitle: content!,
                  date: formattedDate,
                  color: Colors
                      .primaries[DateTime.now().second %
                          Colors.primaries.length]
                      .value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
