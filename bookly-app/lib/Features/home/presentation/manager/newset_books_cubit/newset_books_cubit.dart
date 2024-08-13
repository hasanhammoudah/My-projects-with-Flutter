import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repos/home_repo.dart';
import 'package:booklyapp/Features/home/domain/usecases/fetch_newset_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksCubitState> {
  NewsetBooksCubit(this.fetchNewSetBooksUseCase)
      : super(NewsetBooksCubitInitial());

  final FetchNewSetBooksUseCase fetchNewSetBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksCubitLoading());
    var result = await fetchNewSetBooksUseCase.call();
    result.fold((failure) {
      emit(NewsetBooksCubitFailure(failure.errMessage));
    }, (books) {
      emit(NewsetBooksCubitSuccess(books));
    });
  }
}
