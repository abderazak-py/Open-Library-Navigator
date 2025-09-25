import 'package:bookly/core/widgets/loading_skeleton.dart';
import 'package:flutter/material.dart';

class LoadingBookItem extends StatelessWidget {
  const LoadingBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.16,
      child: Row(
        children: [
          const AspectRatio(aspectRatio: 2 / 3, child: LoadingSkeleton()),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingSkeleton(width: width * 0.6, height: 20),
                const SizedBox(height: 10),
                LoadingSkeleton(width: width * 0.3, height: 14),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    LoadingSkeleton(height: 20, width: 60),
                    Spacer(),
                    LoadingSkeleton(height: 14, width: 50),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
