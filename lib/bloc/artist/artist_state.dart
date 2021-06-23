import 'package:equatable/equatable.dart';
import 'package:movie_app/movie.dart';

abstract class ArtistState extends Equatable{
  @override
  List<Object?> get props => [];
}
class ArtistStateInit extends ArtistState{}

class ArtistStateLoading extends ArtistState{}

class ArtistStateSuccess extends ArtistState{
  final List<CastData>  list;
  ArtistStateSuccess({required this.list});

  @override
  List<Object?> get props => [list];
}


class ArtistStateFailed extends ArtistState{
  final String e;
  ArtistStateFailed({required this.e});

  @override
  List<Object?> get props => [e];

}
