import 'package:chatapp/constants.dart';
import 'package:chatapp/helper/show_snacbar.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:chatapp/screens/widget/custom_button.dart';
import 'package:chatapp/screens/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                    Image.asset(kLogo),
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
                        submitButton();
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
        ));
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  Future<void> submitButton() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      try {
        await loginUser();
        Navigator.pushNamed(context, ChatScreen.id);
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          showSnacbar(context, 'No user found for that email.');
        } else if (ex.code == 'Wrong password provided for the user.') {
          showSnacbar(context, 'Wrong password provided for the user.');
        }
      } catch (ex) {
        showSnacbar(context, 'there was an error');
      }
      isLoading = false;
      setState(() {});
    } else {}
  }
}
