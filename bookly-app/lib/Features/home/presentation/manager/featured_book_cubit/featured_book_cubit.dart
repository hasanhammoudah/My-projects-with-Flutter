import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());


  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await featuredBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedBookFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBookSuccess(books));
    });
  }
}
