import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MoviesEventFetch extends MoviesEvent {
  final String selectedItem;

   MoviesEventFetch({required this.selectedItem});

   @override
  List<Object> get props => [selectedItem];
}
