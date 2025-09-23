import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.count});
  final dynamic rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffffdd4f),
          size: 14,
        ),
        const SizedBox(width: 6),
        Text('$rating', style: Styles.titleText16),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.7,
          child: Text('($count)', style: Styles.titleText14),
        ),
      ],
    );
  }
}
