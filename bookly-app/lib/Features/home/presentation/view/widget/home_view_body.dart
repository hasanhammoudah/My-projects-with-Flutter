import 'package:booklyapp/Features/home/presentation/view/widget/best_seller_list_view.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/custom_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/featured_books_list_view_bloc_builder.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              const FeaturedBooksListViewBlocBuilder(),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newset Books',
                  style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            //  const FeaturedBooksListViewBlocBuilder(),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
           // child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}


