import 'package:booklyapp/Features/home/presentation/view/widget/best_seller_list_view.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/custom_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/fetured_list_view.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/app_routers.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              const FeaturedBooksListView(),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //const BookListViewItem(),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView);
                },
                child: const BestSellerListView()),
          ),
        )
      ],
    );
  }
}
