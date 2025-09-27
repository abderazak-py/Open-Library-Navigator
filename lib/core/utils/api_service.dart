import 'package:dio/dio.dart';
import 'package:open_library_navigator/api_key.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint$apiKey');
    return response.data;
  }
}
