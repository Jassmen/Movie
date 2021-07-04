import 'package:equatable/equatable.dart';



abstract class ArtistEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ArtistEventFetch extends ArtistEvent{
  final String? id;

  ArtistEventFetch({required this.id});

  @override
  List<Object?> get props => [id];

}
