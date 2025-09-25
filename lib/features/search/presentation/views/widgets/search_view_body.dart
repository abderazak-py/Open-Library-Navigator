import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/loading_book_item.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextField(),
            const SizedBox(height: 16),
            const Text('Search Results', style: Styles.titleText18),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Container();
                  } else if (state is SearchSuccess) {
                    return SearchResultListView(books: state.books);
                  } else if (state is SearchFilure) {
                    return CustomErrorWidget(errorMessage: state.errMessage);
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, inex) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: LoadingBookItem(),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
