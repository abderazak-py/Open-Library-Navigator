import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffffdd4f), size: 14),
        SizedBox(width: 6),
        Text('4.8', style: Styles.titleText16),
        SizedBox(width: 5),
        Opacity(opacity: 0.7, child: Text('(239)', style: Styles.titleText14)),
      ],
    );
  }
}
