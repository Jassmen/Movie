import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/model/movie_type.dart';
import 'package:movie_app/model/search.dart';

import '../model/movie.dart';
import 'package:http/http.dart' as http;

import 'api_const.dart';

Future<List<Movie>> fetchMovie(String selectedItem) async {
  try {
    final url = '$baseUrl/movie/$selectedItem?api_key=$apiKey';
    final response = await dio.get(url);
    var movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  } catch (error, stacktrace) {
    throw Exception('Exception accoured: $error with stacktrace: $stacktrace');
  }
}

Future<String> fetchYouTubeId(int id) async {
  try {
    final response = await dio.get('$baseUrl/movie/$id/videos?api_key=$apiKey');
    var youtubeId = response.data['results'][0]['key'];
    return youtubeId;
  } catch (error, stacktrace) {
    throw Exception('Exception accoured: $error with stacktrace: $stacktrace');
  }
}

Future<List<CastData>> fetchCastDATA(int id) async {
  try {
    final response = await dio.get('$baseUrl/movie/$id/credits?api_key=$apiKey');
    var castListUrl = response.data['cast'] as List;
    List<CastData> castList = castListUrl.map((m) => CastData.fromJson(m)).toList();

    return castList;
  } catch (error, stacktrace) {
    throw Exception('Exception accoured: $error with stacktrace: $stacktrace');
  }
}

Future<List<MovieType>> fetchType(int id) async {
  try {
    final url = '$baseUrl/movie/$id?api_key=$apiKey';
    final response = await dio.get(url);
    var type = response.data['genres'] as List;
    List<MovieType> movieType = type.map((e) => MovieType.fromJson(e)).toList();
    return movieType;
  } catch (error, stacktrace) {
    throw Exception('Exception accoured: $error with stacktrace: $stacktrace');
  }
}

Future<List<Search>> fetchSearch(String movieName) async {
  final response = await dio.get('$baseUrl/search/movie?api_key=$apiKey&language=en-US&query=$movieName');
  var data = response.data['results'] as List;
  print('Search-------------- $data');
  List<Search> searchList = data.map((e) => Search.fromJson(e)).toList();
  return searchList;
}
