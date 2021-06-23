import 'package:equatable/equatable.dart';

abstract class VideoState extends Equatable{
  @override
  List<Object?> get props => [];
}
class VideoStateInitial extends VideoState{}

class VideoStateLoading extends VideoState{}

class VideoStateSuccess extends VideoState{
  final String videoUrl;
  VideoStateSuccess({required this.videoUrl});

  @override
  List<Object?> get props => [videoUrl];
}

class VideoStateFailed extends VideoState{
  final String error;
  VideoStateFailed({required this.error});

  @override
  List<Object?> get props => [error];
}