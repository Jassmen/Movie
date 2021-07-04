import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie.dart';


abstract class SearchState extends Equatable{
  @override
  List<Object?> get props => [];
}


class SearchStateInit extends SearchState{}

class SearchStateLoading extends SearchState{}

class SearchStateSuccess extends SearchState{
  final List<Movie> list;

  SearchStateSuccess({required this.list});

  @override
  List<Object?> get props => [list];
}

class SearchStateFailed extends SearchState{
  final String error;

  SearchStateFailed({required this.error});

  @override
  List<Object?> get props => [error];
}