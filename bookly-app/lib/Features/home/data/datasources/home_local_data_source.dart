import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchSimilarBooks({required String category});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookModel>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookModel>(kNewestBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category}) {
    var box = Hive.box<BookModel>(kNewestBox);
    return box.values
        .where((book) => book.categories.contains(category))
        .toList();
  }
}
