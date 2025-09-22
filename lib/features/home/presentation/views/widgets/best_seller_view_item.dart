import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BestSellerViewItem extends StatelessWidget {
  const BestSellerViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(AssetsData.testImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
