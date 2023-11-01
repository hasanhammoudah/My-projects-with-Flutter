import 'package:chatapp/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatapp/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:chatapp/simple_bloc_observe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserve();
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatScreen.id: (context) => const ChatScreen(),
        },
        initialRoute: LoginScreen.id,
      ),
    );
  }
}
