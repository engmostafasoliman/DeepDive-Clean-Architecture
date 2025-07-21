import 'package:deep_dive_mvvm/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    // var response = await _dio.get('$baseUrl$endPoint');
    // return response.data;
    try {
      final response = await _dio.get('$baseUrl$endPoint');
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      final appException = handleDioError(e);
      return Future.error(appException.message);
      print(appException.message);
    } catch (e) {
      return Future.error("Unexpected error: $e");
      print("Unexpected error: $e");
    }
  }

}

Future<void> fetchData() async {

}
