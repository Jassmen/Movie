import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movie.dart';

import 'build_text.dart';
import 'movie.dart';
import 'movie_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  int backgroundIndex = 0;
  void fun() => print("hhh");

  @override
  void initState() {
    pageController = PageController(
      viewportFraction: .8,
      initialPage: 0,
    )..addListener(fun);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Movie movie = getMovie[backgroundIndex];
    int topRate = 10;

    return Scaffold(
        body: Stack(
      children: [
        buildBackgroundImage(movie.imageBlur, size),
        buildbody(size, getMovie[backgroundIndex])
      ],
    ));
  }

  Widget buildBackgroundImage(String img, Size size) {
    return Container(
        height: size.height,
        width: size.width,
        child: Image.asset(img, fit: BoxFit.cover));
  }

  Widget buildToolbar(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 150, // TODO: use screen util
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Top Rated', //TODO: use BuildText
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.white,
                      size: 30,
                    )
                  ]),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPager(Size size, int page) {
    return Container(
      height: size.height * .6,
      child: PageView.builder(
        onPageChanged: (pageIndex) {
          setState(() {
            backgroundIndex = pageIndex;
          });
        },
        controller: pageController,
        itemBuilder: (context, index) => MovieCard(getMovie[index]),
        itemCount: getMovie.length,
      ),
    );
  }

  Widget buildMovieText(
      String movieName, double rate, Size size, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              AppText(
                text: movieName,
                fontWeight: FontWeight.bold,
                textSize: 30,
              ),
              Spacer(),
              AppText(
                text: rate.toString(),
                fontWeight: FontWeight.bold,
                textSize: 20,
              ),
              AppText(
                text: '/10',
                textSize: 20,
                color: Colors.white.withOpacity(.5),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: AppText(text: description))
        ],
      ),
    );
  }

  List<Movie> getMovie = [
    Movie(
        'MoonLight',
        'assets/img1.jpeg',
        'assets/back1.jpeg',
        'The Golden Gate Bridge '
            'is a suspension bridge spanning the Golden Gate,'
            ' the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
        7.5),
    Movie(
        'Joker',
        'assets/img4.jpeg',
        'assets/back4.jpeg',
        'The Golden Gate Bridge '
            'is a suspension bridge spanning the Golden Gate,'
            ' the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
        7.2),
    Movie(
        'Logan',
        'assets/img3.jpeg',
        'assets/video2.jpeg',
        'DecorView setVisiblity'
            'DecorView setVisiblityDecorView setVisiblity'
            'DecorView setVisiblityDecorView setVisiblity',
        7.3),
  ];

  Widget buildbody(Size size, Movie movie) {
    return Column(
      children: [
        buildToolbar(size),
        buildPager(size, backgroundIndex),
        buildMovieText(movie.name, movie.rate, size, movie.description),
      ],
    );
  }
}
