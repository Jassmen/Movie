import 'package:dio/dio.dart';

Dio dio = Dio();
const apiKey = '98b32984cf467bd24aba3f3bd5c7037c';
const baseUrl = 'https://api.themoviedb.org/3';

// class ApiService{
//    Dio? dio;
//
//     init(){
//      dio = Dio(
//        BaseOptions(
//          baseUrl: baseUrl,
//          receiveDataWhenStatusError: true
//        )
//      );
//    }
//
//    ApiService();
//
//    Future<Response<T>> getData<T>(String path,{bool hasLanguage = true})async{
//
//      Response<T> response = await dio.get('$path', options: Options(validateStatus: (int? status) {
//        return status! < InternalServerErrorCode;
//      }));
//
//      )
//      return response;
//    }
//
//
// }