import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplachViewBody extends StatelessWidget {
  const SplachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(height: 8),
        const Text(
          'Read Free Books',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
