import 'package:flutter/material.dart';
import 'package:news_app/views/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
        child: CustomScrollView(slivers: [
          NewsListViewBuilder(
            category: category,
          )
        ]),
      ),
    );
  }
}
