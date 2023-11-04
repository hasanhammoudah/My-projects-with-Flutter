import 'package:booklyapp/Features/home/presentation/manager/similar_books_cubit/similar_box_cubit.dart';
import 'package:booklyapp/Features/home/presentation/view/widget/custom_book_image.dart';
import 'package:booklyapp/core/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/widgets/custom_loading_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocBuilder<SimilarBoxCubit, SimilarBoxState>(
        builder: (context, state) {
          if (state is SimilarBoxsuccess) {
            return ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo!.imageLinks?.thumbnail ?? '',
                  ),
                );
              },
            );
          } else if (state is SimilarBoxFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicatorWidget();
          }
        },
      ),
    );
  }
}
