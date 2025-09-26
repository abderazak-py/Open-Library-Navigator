import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/loading_skeleton.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 22),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomBookImage(book: state.books[index]),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 22),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
