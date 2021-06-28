import 'package:equatable/equatable.dart';

class MovieType extends Equatable{
  final int id;
  final String type;

  MovieType({
    required this.id,
    required this.type
  });

  factory MovieType.fromJson(Map<String , dynamic> json){
    return MovieType(
        id: json['id'],
        type: json['name']
    );
  }

  @override
  List<Object?> get props => [id,type];

}