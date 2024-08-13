import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
