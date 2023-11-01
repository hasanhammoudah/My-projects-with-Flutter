import 'package:chatapp/constants.dart';
import 'package:chatapp/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatapp/helper/show_snacbar.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/widget/custom_button.dart';
import 'package:chatapp/screens/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static String id = 'registerPage';

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatScreen.id);
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnacbar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                      Image.asset('assets/images/scholar.png'),
                      const Text(
                        'Scholar Chat',
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
                            'REGISTER',
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
                        // onSaved: (p0) => ,
                        hintText: 'Email',
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormTextField(
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
                            AuthCubit().registerUser(
                                email: email!, password: password!);
                          }
                        },
                        text: 'Register',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'already have an account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
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
        );
      },
    );
  }
}
