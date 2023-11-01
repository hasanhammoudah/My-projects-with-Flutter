import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'user-not-found'));
      } else if (ex.code == 'Wrong password provided for the user.') {
        emit(LoginFailure(
            errorMessage: 'Wrong password provided for the user.'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'somthing went wrong.'));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'weak-password'));
      } else if (ex.code == 'The password provided is too weak') {
        emit(
            RegisterFailure(errorMessage: 'The password provided is too weak'));
      } else {
        emit(RegisterFailure(errorMessage: 'email already exists'));
      }
    } catch (e) {}
  }
}
