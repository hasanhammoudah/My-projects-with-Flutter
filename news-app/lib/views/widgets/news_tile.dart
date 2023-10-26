import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: articleModel.image != null
              ? Image.network(
                  articleModel.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const SizedBox(),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title.toString(),

          /* 'Overflow' */
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.subTitle.toString(),
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
