import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/colors_list_view.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';
import 'package:notes/views/widgets/custom_text_field.dart';
import 'package:notes/views/widgets/edit_note_colors_list_view.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, this.note});

  final NoteModel? note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note!.title = title ?? widget.note!.title;
              widget.note!.subTitle = content ?? widget.note!.subTitle;
              widget.note!.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note!.title,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.note!.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.note!,
          ),
        ],
      ),
    );
  }
}

