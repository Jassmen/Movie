import 'package:flutter/material.dart';

/*class Movie {
  final int id;
  final String name;
  final String imageTop;
  final String imageBlur;
  final String description;
  final double rate;
  final String backImgDetail;
  final String movieImage;
  final String writer;
  final String writerStates;
  final String director;
  final String directorStates;
  final String movieType;
  final String duration;
  final String date;
  final String year;
  final String video;
  final List artist;

  Movie(
      {required this.id,
        required this.name,
      required this.imageTop,
      required this.imageBlur,
      required this.description,
      required this.rate,
      required this.backImgDetail,
      required this.movieImage,
      required this.writer,
      required this.writerStates,
      required this.director,
      required this.directorStates,
      required this.movieType,
      required this.duration,
      required this.date,
      required this.year,
      required this.video,
      required this.artist});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      //id: json["id"],
      name: json["title"],
      imageTop: json["image"],
      rate: json["numOfProducts"],
    );
  }


}*/

/*class Movie{
  final String id;
  fianl String title;
  fianl String overview;
  fianl String rate;
  fianl String poster;
  fianl String backdrop;
  fian String date;
  //final List cast;
  Movie({
    required this.id,
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
      rate: json["vote_average"],
      overview:json['overview'],
      date: json['release_date'],
      backdrop: json['backdrop_path']

    );
  }
}*/

class Movie {
  final int id;
  final String title;
  final String overview;
  final String rate;
  final String date;
  final String backdrop;
  final String poster;

  String trailedId='';


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
}


