import 'package:flutter/material.dart';
import 'package:hasancv/view/first_view.dart';
import 'package:hasancv/view/second_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  // create on Next Page Function

  void onNextPage(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut);
  }

  @override
  Widget build(BuildContext context) {
    /// For making app responsive for the phone size
    Size size = MediaQuery.of(context).size;

    /// For accessing application theme both Light and Dark mode
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [
            FirstView(
              onNextPage: () => onNextPage(1),
            ),
            SecondView(
              onNextPage: () => onNextPage(0),
            ),
          ],
        ),
      ),
    );
  }
}
