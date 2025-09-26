import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFilure extends Failure {
  ServerFilure({required super.errMessage});

  factory ServerFilure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFilure(errMessage: 'Connection Timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFilure(errMessage: 'Send Timeout with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFilure(errMessage: 'Recive Timeout with Api Server');
      case DioExceptionType.badCertificate:
        return ServerFilure(errMessage: 'Bad Certificate with Api Server');
      case DioExceptionType.badResponse:
        return ServerFilure.fromResponse(
          dioError.response!.statusCode!.toInt(),
          dioError.message,
        );
      case DioExceptionType.cancel:
        return ServerFilure(errMessage: 'Canceled');
      case DioExceptionType.connectionError:
        return ServerFilure(errMessage: 'Check Internet Connection');
      case DioExceptionType.unknown:
        return ServerFilure(errMessage: 'there was an error, try again');
    }
  }

  factory ServerFilure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFilure(
        errMessage: statusCode.toString() + response['error']['message'],
      );
    } else if (statusCode == 404) {
      return ServerFilure(errMessage: 'Not Found, Try later');
    } else if (statusCode == 500) {
      return ServerFilure(errMessage: 'Server Error, Try later');
    } else {
      return ServerFilure(errMessage: 'There was an error, Try later');
    }
  }
}
