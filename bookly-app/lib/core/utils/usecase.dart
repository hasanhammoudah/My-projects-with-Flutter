import 'package:booklyapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseWithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

abstract class UseCaseWithNoParams<Type> {
  Future<Either<Failure, Type>> call();
}
