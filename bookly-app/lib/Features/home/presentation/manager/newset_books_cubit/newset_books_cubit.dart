import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/models/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksCubitState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksCubitInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksCubitLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewsetBooksCubitFailure(failure.errMessage));
    }, (books) {
      emit(NewsetBooksCubitSuccess(books));
    });
  }


}
