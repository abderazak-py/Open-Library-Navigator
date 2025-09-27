import 'package:open_library_navigator/core/utils/app_router.dart';
import 'package:open_library_navigator/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: CachedNetworkImage(
            imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
            fit: BoxFit.fill,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline, size: 99),
          ),
        ),
      ),
    );
  }
}
