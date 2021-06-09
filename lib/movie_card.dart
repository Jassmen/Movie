import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home_screen.dart';
import 'movie.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard(this.movie);
  @override
  Widget build(BuildContext context) {
    var cardWidth = .8.sw;
    var cardHeight = .65.sh;
    return buildMovieImage(
      cardWidth,
      cardHeight,
      movie.poster,
    );
  }

  Widget buildMovieImage(double cardWidth, double cardHeight, String img) {
    return Container(margin: EdgeInsets.symmetric(horizontal: 20.w), width: cardWidth, height: cardHeight, child: appImage(img));
  }
}
