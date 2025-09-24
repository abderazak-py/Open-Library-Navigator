import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/Similar_book_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length - 1,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 22),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CustomBookImage(
                      book: state.books[index + 1],
                    ), // added +1 so that the first book is not shown cuz its the book that is currently being viewed
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return const CustomErrorWidget(errorMessage: 'state.errMessage');
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
