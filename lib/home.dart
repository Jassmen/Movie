import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/detail_screen.dart';
import 'package:movie_app/movie.dart';
import 'package:http/http.dart' as http;


import 'app_sized_box.dart';
import 'build_text.dart';
import 'model/fetchMovie.dart';
import 'movie.dart';
import 'movie_card.dart';
import 'search_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

int backgroundIndex = 0;

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  List<Movie> movies =[];
  
  void fun() => {};

  @override
  void initState() {
    allMovies();
    pageController = PageController(
      viewportFraction: .8,
      initialPage: 0,
    )..addListener(fun);
  }

  void allMovies()  async {
    final movie = await fetchMovie();
    print(movie);
    setState(() {
      movies = movie;
    });
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Movie movie = movies[backgroundIndex];
    print('jkMovie -------------------> $movie');

    return Scaffold(
        body: Stack(
      children: [
        appImage('https://image.tmdb.org/t/p/original${movie.poster}', size),
        buildBody(size, movies[backgroundIndex])
      ],
    ));
  }

  Widget buildBody(Size size, Movie movie) {
    return SingleChildScrollView(
      child:BackdropFilter(
          filter:ImageFilter.blur(
              sigmaX:10.0,
              sigmaY:10.0
          ),
          child: Column(
        children: [
          AppSizedBox(
            height: 50.h,
          ),
          buildToolbar(size, 'Top Rated', Icons.search, context),
          buildPager(size, backgroundIndex),
          buildMovieText(movie.title, movie.rate, size, movie.overview),
        ],
      )),
    );
  }

  Widget buildPager(Size size, int page) {
    return InkWell(
      onTap: () {

 /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(movies[backgroundIndex])));*/

      },
      child: Container(
        height: .6.sh,
        child: PageView.builder(
          onPageChanged: (pageIndex) {
            setState(() {
              backgroundIndex = pageIndex;
            });
          },
          controller: pageController,
          itemBuilder: (context, index) => MovieCard(movies[index]),
          itemCount: movies.length,
        ),
      ),
    );
  }

  Widget buildMovieText(
      String movieName, String rate, Size size, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              AppSizedBox(
                width: 20.w,
              ),
              Expanded(
                flex: 9,
                child: AppText(
                  text: movieName,
                  fontWeight: FontWeight.bold,
                  textSize: 20.sp,
                ),
              ),
              Spacer(),
              AppText(
                text: rate,
                fontWeight: FontWeight.bold,
                textSize: 20.sp,
              ),
              AppText(
                text: '/10',
                textSize: 20.sp,
                color: Colors.white.withOpacity(.5),
              ),
              AppSizedBox(
                width: 20.w,
              ),
            ],
          ),
          AppSizedBox(
            height: 20.h,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: AppText(text: description))
        ],
      ),
    );
  }
}

Widget appImage(String img, Size size,) {
  return Container(
      height:1.sh,
      width:1.sw,
      child: Image.network(img,fit: BoxFit.cover));
}

Widget buildToolbar(Size size, String text, IconData icon, BuildContext context,
    {String data = ''}) {
  return Container(
    height: 70.h, // TODO: use screen util
    child: InkWell(
      onTap: () {},
      child: Row(
        children: [
          AppSizedBox(
            width: 20.w,
          ),
          AppText(
              text: text,
              color: Colors.white,
              textSize: 30,
              fontWeight: FontWeight.bold),
          data == ''
              ? Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.white,
                  size: 30,
                )
              : AppText(
                  text: '(' + data.toString() + ')',
                  textSize: 15,
                ),
          Spacer(),
          IconButton(
              onPressed: () {
                icon == Icons.search;

/*? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchScreen()))
                    : null;*/

              },
              icon: Icon(icon)),
          AppSizedBox(
            width: 20.w,
          ),
        ],
      ),
    ),
  );
}




