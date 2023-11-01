import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
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
    });
  }


 /*. To track state */
  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);

    print(transition);
  }
}
