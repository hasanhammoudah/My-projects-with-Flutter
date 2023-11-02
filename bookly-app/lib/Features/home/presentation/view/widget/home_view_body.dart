import 'package:booklyapp/Features/home/presentation/view/widget/best_seller_list_view_item.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/custom_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/fetured_list_view.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const FeaturedBooksListView(),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Best Seller',
            style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
          ),
          const SizedBox(
            height: 20,
          ),
          const BestSellerListViewItem(),
        ],
      ),
    );
  }
}

