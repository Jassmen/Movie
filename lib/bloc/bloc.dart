import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/states.dart';
import 'package:movie_app/movie.dart';
import 'package:movie_app/services/fetchMovie.dart';

class MovieBloc extends Cubit<MovieStatus>{
  MovieBloc() : super(MovieInitial());

  // make it easy to call it in any place
  static MovieBloc get(BuildContext context) => BlocProvider.of(context);


  void fetchMovieBloc() async {
    List<Movie> movieList = await fetchMovie();
    emit(MovieLoaded(movieList));

}




}

