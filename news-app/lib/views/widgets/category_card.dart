import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                category.imageAssetUrl,
              )),
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Center(
          child: Text(
          category.categoryName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
