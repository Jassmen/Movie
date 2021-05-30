import 'package:flutter/cupertino.dart';

import '../movie.dart';
import 'fetchMovie.dart';

class ArticlesListViewModel extends ChangeNotifier {
  List<Movie> _movie = [];


  Future<void> fetchMovies() async {
    _movie = await fetchMovie();
    notifyListeners();
  }


  List<Movie> get movie => _movie;

}