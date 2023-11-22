import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/sign_up_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/options_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: FirebaseOptionSecurity.kApiKey,
            appId: FirebaseOptionSecurity.kAppId,
            messagingSenderId: FirebaseOptionSecurity.kMessagingSender,
            projectId: FirebaseOptionSecurity.kProjectId,
            storageBucket: FirebaseOptionSecurity.kStorageBucket));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const Scaffold(
      //   body: ResponsiveLayout(
      //       webScreenLayout: WebScreenLayout(),
      //       mobileScreenLayout: MobileScreenLayout()),
      // ),
      home: const LoginScreen(),
    );
  }
}
