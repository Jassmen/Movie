import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


class SearchEventFetch extends SearchEvent{
  final String movieName;

  SearchEventFetch({required this.movieName});

  @override
  List<Object?> get props => [movieName];

}