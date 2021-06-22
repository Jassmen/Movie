import 'package:equatable/equatable.dart';
import 'package:movie_app/movie.dart';

abstract class MovieStatus extends Equatable{
  const MovieStatus();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieStatus{}

class MovieLoaded extends MovieStatus{

  final List<Movie> movieList;

  const MovieLoaded(this.movieList);

  @override
  List<Object?> get props => [movieList];
}

class MovieError extends MovieStatus{}