import 'package:booklyapp/Features/home/data/datasources/home_local_data_source.dart';
import 'package:booklyapp/Features/home/data/datasources/home_remote_dara_source.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repos/home_repo.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks() async {
    try {
      final books = await homeLocalDataSource.fetchNewestBooks();
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      final books = await homeLocalDataSource.fetchFeaturedBooks();
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      final books =
          await homeLocalDataSource.fetchSimilarBooks(category: category);
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
