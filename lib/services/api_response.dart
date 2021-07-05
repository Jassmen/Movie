import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/apiservices.dart';

class ApiResponse{
  final _apiKey = '?api_key=98b32984cf467bd24aba3f3bd5c7037c';
  final  _baseUrl = 'https://api.themoviedb.org/3';
  final _language = '&language=en-US&query=';
  final _movie = '/movie/';
  ApiService? _apiService;

   String? selectedItem;



  Future<List<Movie>> fetchMovie(String selectedItem)async{
    try{
      final path = _baseUrl+_movie+selectedItem+_apiKey;
      final response = await _apiService!.getData(path);
      var list = response.data['results'] as List;
      List<Movie> movieList = list.map((m) => Movie.fromJson(m)).toList();
      return movieList;

    }catch(error, stacktrace){
      throw Exception('Exception accoured: $error with stacktrace: $stacktrace');

    }
  }

  // Future<List<Movie>> fetchMovie(String selectedItem) async {
  //   try {
  //     final url = '$baseUrl/movie/$selectedItem?api_key=$apiKey';
  //     final response = await dio.get(url);
  //     var movies = response.data['results'] as List;
  //     List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
  //     return movieList;
  //   } catch (error, stacktrace) {
  //     throw Exception('Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }

}