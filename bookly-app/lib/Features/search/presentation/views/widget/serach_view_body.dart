import 'package:booklyapp/Features/home/presentation/view/widget/book_list_view_item.dart';
import 'package:booklyapp/Features/search/presentation/views/widget/custom_search_text_field.dart';
import 'package:booklyapp/Features/search/presentation/views/widget/serach_result_list_view.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
