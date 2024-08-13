import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(1)
  final String bookId;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String? authorName;
  @HiveField(5)
  final num? price;
  @HiveField(6)
  final num? rating;
  @HiveField(7)
  final List<String> categories;

  BookEntity({
    required this.categories,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.bookId,
  });
}
