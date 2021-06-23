import 'package:equatable/equatable.dart';

abstract class VideoEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class VideoEventFetch extends VideoEvent{
  final int id;
  VideoEventFetch({required this.id});

  @override
  List<Object?> get props => [id];
}