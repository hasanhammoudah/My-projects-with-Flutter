import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/usecases/fetch_similar_books_use_case.dart';
import 'package:meta/meta.dart';

part 'similar_box_state.dart';

class SimilarBoxCubit extends Cubit<SimilarBoxState> {
  SimilarBoxCubit(this.fetchSimilarBooksUseCase) : super(SimilarBoxInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBoxLoading());
    var result = await fetchSimilarBooksUseCase.call(category);
    result.fold((failure) {
      emit(SimilarBoxFailure(failure.errMessage));
    }, (books) {
      emit(SimilarBoxsuccess(books));
    });
  }
}
