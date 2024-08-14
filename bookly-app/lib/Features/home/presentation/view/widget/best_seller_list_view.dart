import 'package:booklyapp/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/book_list_view_item.dart';
import 'package:booklyapp/core/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/widgets/custom_loading_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksCubitState>(
      builder: (context, state) {
        if (state is NewsetBooksCubitSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FeaturedBooksListView(
                    books: state.books,
                  ),
                );
              });
        } else if (state is NewsetBooksCubitFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicatorWidget();
        }
      },
    );
  }
}
