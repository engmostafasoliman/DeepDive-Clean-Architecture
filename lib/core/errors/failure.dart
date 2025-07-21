import 'package:dio/dio.dart';

// class Failure{
//   Failure(String string);
// }
Failure handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return FetchDataException("Connection timed out");
    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode ?? 0;
      final message = error.response?.data.toString() ?? 'Unknown error';
      if (statusCode == 400) {
        return BadRequestException(message);
      } else if (statusCode == 401 || statusCode == 403) {
        return UnauthorizedException(message);
      } else {
        return FetchDataException("Error with status code: $statusCode");
      }
    case DioExceptionType.cancel:
      return Failure("Request cancelled");
    case DioExceptionType.unknown:
    default:
      if (error.message?.contains('SocketException') ?? false) {
        return NoInternetException("No internet connection");
      }
      return Failure("Unexpected error occurred");
  }
}
class Failure implements Exception {
  final String message;
  final String? prefix;

  Failure(this.message, [this.prefix]);

  @override
  String toString() => "$prefix$message";
}

class BadRequestException extends Failure {
  BadRequestException(String message) : super(message, "Bad Request: ");
}

class UnauthorizedException extends Failure {
  UnauthorizedException(String message) : super(message, "Unauthorized: ");
}

class FetchDataException extends Failure {
  FetchDataException(String message) : super(message, "Fetch Data: ");
}

class NoInternetException extends Failure {
  NoInternetException(String message) : super(message, "No Internet: ");
}
