import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              text: '19.99 €',
            ),
          ),
          Expanded(
            child: CustomButton(
              fontSize: 16,
              backgroundColor: Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              text: 'Free Preview',
            ),
          ),
        ],
      ),
    );
  }
}
