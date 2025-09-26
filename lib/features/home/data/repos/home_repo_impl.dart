import 'package:bookly/constants.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  final box = GetStorage();
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=computer sience&maxResults=40&sorting=newest',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      box.write(kNewestBooks, data); //save newestbooks to local storage

      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        if (DioExceptionType.connectionError == e.type &&
            box.read(kNewestBooks) != null &&
            box.read(kNewestBooks).isNotEmpty) {
          List<BookModel> books = [];
          for (var item in box.read(kNewestBooks)['items']) {
            books.add(BookModel.fromJson(item));
          }
          return right(books);
        }
        ServerFilure.fromDioError(e);
      }

      return left(ServerFilure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=programming&maxResults=40',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      box.write(kFeaturedBooks, data);
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        if (DioExceptionType.connectionError == e.type &&
            box.read(kFeaturedBooks) != null &&
            box.read(kFeaturedBooks).isNotEmpty) {
          List<BookModel> books = [];
          for (var item in box.read(kFeaturedBooks)['items']) {
            books.add(BookModel.fromJson(item));
          }
          return right(books);
        }
        ServerFilure.fromDioError(e);
      }
      return left(ServerFilure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:$category&maxResults=40',
      );
      List<BookModel> books = [];

      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }

        box.write(kSimilarBooks + category, data);
        return right(books);
      }
      return left(ServerFilure(errMessage: 'No Books Found'));
    } on Exception catch (e) {
      if (e is DioException) {
        if (DioExceptionType.connectionError == e.type &&
            box.read(kSimilarBooks + category) != null &&
            box.read(kSimilarBooks + category).isNotEmpty) {
          List<BookModel> books = [];
          for (var item in box.read(kSimilarBooks + category)['items']) {
            books.add(BookModel.fromJson(item));
          }
          return right(books);
        }
        ServerFilure.fromDioError(e);
      }
      return left(ServerFilure(errMessage: e.toString()));
    }
  }
}
