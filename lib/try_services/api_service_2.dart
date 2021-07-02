import 'package:dio/dio.dart';

class ApiService{

  Dio _dio = Dio();

      Future<T> fetchData<T> (
      String path,
      {Map<String? , dynamic> body = const {}}
      ) async {
        final response = await _dio.get(path);
        return response.data;
      }
}