import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'movie.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard(this.movie);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var cardWidth = size.width * .8;
    var cardHeight = size.height * .65;
    return buildMovieImage(cardWidth, cardHeight, size, movie.imageTop);
  }

  Widget buildMovieImage(double cardWidth, double cardHeight, Size size,
      String img) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: cardWidth,
      height: cardHeight,
      child:  Image.asset(
          img,
          fit: BoxFit.cover,
      ),
    );
  }

}