import 'package:chatapp/bloc/auth_bloc/auth_bloc.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/helper/show_snacbar.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:chatapp/screens/widget/custom_button.dart';
import 'package:chatapp/screens/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String id = 'LoginPage';
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, ChatScreen.id);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnacbar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Image.asset(kLogo),
                    const Text(
                      'School Chat',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico'),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'pacifico'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormTextField(
                      hintText: 'Email',
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormTextField(
                      obscureText: true,
                      hintText: 'Password',
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          // AuthCubit()
                          //     .loginUser(email: email!, password: password!);
                          
                          /*. Another way for bloc  */
                          AuthBloc().add(
                              LoginEvent(email: email!, password: password!));
                        }
                      },
                      text: 'Login',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'dont\'t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Color(0xffC7EDE6)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
