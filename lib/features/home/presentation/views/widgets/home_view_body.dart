import 'package:open_library_navigator/core/utils/styles.dart';
import 'package:open_library_navigator/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:open_library_navigator/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:open_library_navigator/features/home/presentation/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CustomAppBar()),
        SliverToBoxAdapter(child: FeaturedBookListView()),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 22, top: 30),
            child: Text('Newest Books', style: Styles.titleText18),
          ),
        ),
        NewestBooksListView(),
      ],
    );
  }
}
