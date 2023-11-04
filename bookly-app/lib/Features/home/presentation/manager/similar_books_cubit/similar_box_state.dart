part of 'similar_box_cubit.dart';

@immutable
sealed class SimilarBoxState {}

final class SimilarBoxInitial extends SimilarBoxState {}
final class SimilarBoxLoading extends SimilarBoxState {}

final class SimilarBoxsuccess extends SimilarBoxState {
  final List<BookModel> books;
  SimilarBoxsuccess(this.books);
}

final class SimilarBoxFailure extends SimilarBoxState {
  final String errMessage;
  SimilarBoxFailure(this.errMessage);
}
