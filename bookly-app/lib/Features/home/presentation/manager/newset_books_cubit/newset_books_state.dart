part of 'newset_books_cubit.dart';

@immutable
sealed class NewsetBooksCubitState {}

final class NewsetBooksCubitInitial extends NewsetBooksCubitState {}

final class NewsetBooksCubitLoading extends NewsetBooksCubitState {}

final class NewsetBooksCubitSuccess extends NewsetBooksCubitState {
  final List<BookModel> books;
  NewsetBooksCubitSuccess(this.books);
}

final class NewsetBooksCubitFailure extends NewsetBooksCubitState {
  final String errMessage;
  NewsetBooksCubitFailure(this.errMessage);
}
