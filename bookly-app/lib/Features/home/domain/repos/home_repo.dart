import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookEntity>>>fetchNewsetBooks();
  Future<Either<Failure, List<BookEntity>>>fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category});
}
