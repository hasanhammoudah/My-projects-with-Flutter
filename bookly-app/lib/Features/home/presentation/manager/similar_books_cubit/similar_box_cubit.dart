import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/models/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'similar_box_state.dart';

class SimilarBoxCubit extends Cubit<SimilarBoxState> {
  SimilarBoxCubit(this.homeRepo) : super(SimilarBoxInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBoxLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBoxFailure(failure.errMessage));
    }, (books) {
      emit(SimilarBoxsuccess(books));
    });
  }
}
