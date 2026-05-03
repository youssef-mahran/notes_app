import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color selectedColor = Colors.primaries[0];

  Future<void> addNote(NoteModel note) async {
    note.color = selectedColor.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>('notes');
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
