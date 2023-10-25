import 'package:flutter/material.dart';
import 'package:news_app/views/models/category_model.dart';
import 'package:news_app/views/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  final List<CategoryModel> categories = const [
    CategoryModel(
        'assets/images/istockphoto-1465188429-170667a.webp', 'Business'),
    CategoryModel(
        'assets/images/istockphoto-1355687112-170667a.webp', 'Sports'),
    CategoryModel('assets/images/resize.jpeg', 'health'),
    CategoryModel(
        'assets/images/hand-smartphone-records-live-music-260nw-529874515.webp',
        'Entertaiment'),
    CategoryModel('assets/images/download.jpeg', 'Science'),
    CategoryModel('assets/images/shutterstock_739595833-min.jpg', 'Techonlogy'),
    CategoryModel('assets/images/technology.jpeg', 'General'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
