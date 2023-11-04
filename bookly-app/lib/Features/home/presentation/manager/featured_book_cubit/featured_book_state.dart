part of 'featured_book_cubit.dart';

@immutable
sealed class FeaturedBookState {}

final class FeaturedBookInitial extends FeaturedBookState {}

final class FeaturedBookLoading extends FeaturedBookState {}

final class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> books;
  FeaturedBookSuccess(this.books);
}

final class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;
  FeaturedBookFailure(this.errMessage);
}
