import 'package:bookly/core/utils/styles.dart';
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
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: CustomBookDetailsAppbar(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.25,
          ),
          child: const CustomBookImage(),
        ),
        const SizedBox(height: 40),
        const Text('The Jungle Book', style: Styles.titleText30),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.titleText18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 20),
        const BookRating(),
      ],
    );
  }
}
