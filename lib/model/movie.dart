import 'package:equatable/equatable.dart';


class Movie extends Equatable {
  final String? id;
  final String? title;
  final String? overview;
  final String? rating;
  final String? date;
  final String? backdropPath;
  final String? poster;

  Movie(
      {required this.id,
        required this.title,
        required this.overview,
        required this.rating,
        required this.date,
        required this.backdropPath,
        required this.poster});


  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json["id"].toString(),
        title: json["title"],
        poster: json["poster_path"],
        rating: json["vote_average"].toString(),
        overview:json['overview'],
        date: json['release_date'],
        backdropPath: json['backdrop_path'].toString()
    );
}

  @override
  List<Object?> get props => [id,title,poster,rating,overview,date,backdropPath];
}







