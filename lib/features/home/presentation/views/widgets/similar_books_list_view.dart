import 'package:open_library_navigator/core/widgets/custom_error_widget.dart';
import 'package:open_library_navigator/core/widgets/loading_skeleton.dart';
import 'package:open_library_navigator/features/home/presentation/manager/Similar_book_cubit/similar_books_cubit.dart';
import 'package:open_library_navigator/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 22),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CustomBookImage(book: state.books[index]),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return SizedBox(
            height: height * 0.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 22),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: LoadingSkeleton(height: height * 0.3),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
