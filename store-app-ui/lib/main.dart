import 'package:flutter/material.dart';
import 'package:storeapp/screens/home_page.dart';
import 'package:storeapp/screens/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (context) =>  UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
