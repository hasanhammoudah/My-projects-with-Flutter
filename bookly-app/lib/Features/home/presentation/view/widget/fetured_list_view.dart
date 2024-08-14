import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/custom_book_image.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        itemCount: books.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(imageUrl: books[index].image),
          );
        },
      ),
    );
  }
}
