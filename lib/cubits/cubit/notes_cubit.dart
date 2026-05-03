import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchNotes() async {
    emit(NotesLoading());

    final notesBox = Hive.box<NoteModel>('notes');
    final notes = notesBox.values.toList();

    await Future.delayed(const Duration(milliseconds: 100));

    emit(NotesLoaded(notes));
  }
}
