import 'dart:convert';
import 'package:dio/dio.dart';

import '../movie.dart';
import 'package:http/http.dart' as http;

final Dio _dio= Dio();
const apiKey = '98b32984cf467bd24aba3f3bd5c7037c';
const baseUrl = 'https://api.themoviedb.org/3';
Future<List<Movie>> fetchMovie() async{
  try {
      final url = '$baseUrl/movie/now_playing?api_key=$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
 }

Future<String> fetchYouTubeId(int id) async {
  try {
    final response = await _dio.get('$baseUrl/movie/$id/videos?api_key=$apiKey');
    var youtubeId = response.data['results'][0]['key'];
    return youtubeId;
  } catch (error, stacktrace) {
    throw Exception(
        'Exception accoured: $error with stacktrace: $stacktrace');
  }
}

Future<List<CastData>> fetchCastDATA(int id) async{
  try{
    final response = await _dio.get('$baseUrl/movie/$id/credits?api_key=$apiKey');
    var castListUrl=  response.data['cast'] as List;
    List<CastData> castList = castListUrl.map((m) => CastData.fromJson(m)).toList();

    return castList;
  } catch (error, stacktrace) {
    throw Exception(
        'Exception accoured: $error with stacktrace: $stacktrace');
  }
}