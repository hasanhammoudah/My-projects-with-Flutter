import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repos/home_repo.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/core/utils/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchNewSetBooksUseCase extends UseCaseWithNoParams<List<BookEntity>> {
  final HomeRepo homeRepo;
  FetchNewSetBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() =>
      homeRepo.fetchNewsetBooks();
}
