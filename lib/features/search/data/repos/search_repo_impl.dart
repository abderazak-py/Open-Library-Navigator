import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({
    required String search,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=$search&maxResults=40',
      );

      List<BookModel> books = [];

      if (data['items'] == null) {
        return left(ServerFilure(errMessage: 'No Books Found'));
      }
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        ServerFilure.fromDioError(e);
      }
      return left(ServerFilure(errMessage: e.toString()));
    }
  }
}
