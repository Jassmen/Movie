import 'package:equatable/equatable.dart';


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







