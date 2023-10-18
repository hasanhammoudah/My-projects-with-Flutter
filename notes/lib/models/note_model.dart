import 'package:hive/hive.dart';

// TODO To build the line put this command =>
/*  flutter packages pub run build_runner build */
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel(
    this.title,
    this.subTitle,
    this.date,
    this.color,
  );
}
