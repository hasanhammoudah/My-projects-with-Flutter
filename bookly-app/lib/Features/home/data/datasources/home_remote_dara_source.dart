import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/core/utils/functions/save_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewsetBooks();
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint:
          'volumes?q=computer science&Filtering=free-ebooks&Sorting=newset',
    );
    List<BookModel> books = [];

    for (var item in data['items']) {
      try {
        books.add(BookModel.fromJson(item));
      } catch (e) {
        books.add(BookModel.fromJson(item));
      }
    }
    saveData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?q=subject:programming&Filtering=free-ebooks');
    List<BookEntity> books = (data['items'] as List)
        .map((item) => BookModel.fromJson(item))
        .toList();
        saveData(books, kNewestBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=relevance');
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    saveData(books, kSimilarBox);
    return books;
  }
}
