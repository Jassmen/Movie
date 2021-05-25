import 'package:flutter/material.dart';

class Movie {
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
      this.name,
      this.imageTop,
      this.imageBlur,
      this.description,
      this.rate,
      this.backImgDetail,
      this.movieImage,
      this.writer,
      this.writerStates,
      this.director,
      this.directorStates,
      this.movieType,
      this.duration,
      this.date, this.year, this.video,this.artist);
}

class SearchedMovie{
  final String image;
  final String movieName;
  final String rating;
  final String movieType;
  final String duration;
  final String date;
  final String description;

  SearchedMovie({
      required this.image,
      required this.movieName,
      required this.rating,
      required this.movieType,
      required this.duration,
      required this.date,
      required this.description});



}