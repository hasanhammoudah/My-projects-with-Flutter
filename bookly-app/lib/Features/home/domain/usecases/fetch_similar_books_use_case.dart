import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repos/home_repo.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/core/utils/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase
    extends UseCaseWithParams<List<BookEntity>, String> {
  final HomeRepo homeRepo;
  
  FetchSimilarBooksUseCase(this.homeRepo);
  // Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks(
  //     {required String category}) {
  //   return homeRepo.fetchSimilarBooks(category: category);
  // }

  @override
  Future<Either<Failure, List<BookEntity>>> call(String param) =>
      homeRepo.fetchSimilarBooks(category: param);
}
