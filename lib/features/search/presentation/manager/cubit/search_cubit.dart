import 'package:bloc/bloc.dart';
import 'package:open_library_navigator/features/home/data/models/book_model/book_model.dart';
import 'package:open_library_navigator/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String search}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(search: search);
    result.fold(
      (failure) {
        emit(SearchFilure(failure.errMessage));
      },
      (books) {
        emit(SearchSuccess(books));
      },
    );
  }
}
