import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movie.dart';

abstract class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

// intial State
class MoviesStateInitial extends MoviesState {}

// loading State
class MoviesStateLoading extends MoviesState {}

// Success State
class MoviesStateSuccess extends MoviesState {
  final List<Movie> list;
  MoviesStateSuccess({required this.list});

  @override
  List<Object?> get props => [list];
}

// error State
class MoviesStateFailed extends MoviesState {
  final String error;
  MoviesStateFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
