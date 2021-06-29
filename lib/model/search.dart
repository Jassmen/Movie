import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final String id;
  final String title;
  final String overview;
  final String backdropPath;
  final String rating;
  final String date;

  Search({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.rating,
    required this.date
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
        id: json['id'].toString(),
        title: json['title'],
        overview: json['overview'],
        backdropPath:json['backdrop_path'],
        rating: json['vote_average'].toString(),
        date: json['release_date'].toString()
    );
  }

  @override
  List<Object?> get props => [id, title, overview,backdropPath,rating,date];
}
