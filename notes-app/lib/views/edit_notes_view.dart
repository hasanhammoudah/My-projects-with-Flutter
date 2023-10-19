import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/edit_view_note_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesViewBody(
        note: note,
      ),
    );
  }
}
