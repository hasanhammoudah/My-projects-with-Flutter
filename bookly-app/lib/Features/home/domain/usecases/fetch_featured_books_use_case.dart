import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repos/home_repo.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/core/utils/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
