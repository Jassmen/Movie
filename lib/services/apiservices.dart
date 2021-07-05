import 'package:dio/dio.dart';

class ApiService{
  Dio? _dio;
  String? path;


  ApiService({required this.path});


  Future<Response<T>> getData<T>(String  path)async{
    Response<T> response= await  _dio!.get(path);

    return response;
  }

}