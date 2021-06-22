import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String rate;
  final String date;
  final String backdrop;
  final String poster;

  Movie(
      {required this.id,
        required this.title,
        required this.overview,
        required this.rate,
        required this.date,
        required this.backdrop,
        required this.poster});


  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json["id"],
        title: json["title"],
        poster: json["poster_path"],
        rate: json["vote_average"].toString(),
        overview:json['overview'],
        date: json['release_date'],
        backdrop: json['backdrop_path']
    );
}

  @override
  List<Object?> get props => [id,title,poster,rate,overview,date,backdrop];
}


class CastData extends Equatable{
  final String name;
  final String profilePath;
  final String character;
  CastData({
    required this.name,
    required this.profilePath,
    required this.character});

  factory CastData.fromJson(Map<String, dynamic> json) {
    return CastData(
        name: json['name'],
        profilePath:json['profile_path'].toString(),
        character: json['character']
    );

  }

  @override
  // TODO: implement props
  List<Object?> get props => [name,profilePath,character];
}

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
  // TODO: implement props
  List<Object?> get props => [id,type];

}


