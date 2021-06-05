import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';
import 'movie.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard(this.movie);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var cardWidth =  .8.sw;
    var cardHeight =  .65.sh;
    return buildMovieImage(cardWidth, cardHeight, size, movie.poster,);
  }

  Widget buildMovieImage(double cardWidth, double cardHeight, Size size,
      String img) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: cardWidth,
      height: cardHeight,
      child:appImage(img,size)

    );
  }

}