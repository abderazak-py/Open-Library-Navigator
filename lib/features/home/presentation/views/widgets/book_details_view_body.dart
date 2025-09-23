import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 5, right: 30, left: 30),
          child: CustomBookDetailsAppbar(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.28,
          ),
          child: const CustomBookImage(),
        ),
        const SizedBox(height: 40),
        const Text('The Jungle Book', style: Styles.titleText30),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.5,
          child: Text(
            'Rudyard Kipling',
            style: Styles.titleText18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 18),
        const BookRating(),
        const SizedBox(height: 37),
        const BookAction(),
      ],
    );
  }
}
