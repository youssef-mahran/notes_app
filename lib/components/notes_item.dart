import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view_items.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditViewItems(note: note)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: const BoxConstraints(minHeight: 120),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    note.title,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),

                  subtitle: Text(
                    note.subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchNotes();
                    },
                  ),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    note.date,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
