import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MoviesEventFetch extends MoviesEvent {
  // final int id;

  // MoviesEventFetch({required this.id});

  // @override
  // List<Object> get props => [id];
}
