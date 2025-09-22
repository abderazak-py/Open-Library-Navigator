import 'package:bookly/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 22),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const FeaturedListViewItem();
        },
      ),
    );
  }
}
