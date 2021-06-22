import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/bloc/bloc.dart';
import 'package:movie_app/bloc/states.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:movie_app/movie.dart';

import '../widgets/app_sized_box.dart';
import '../widgets/build_text.dart';
import '../services/fetchMovie.dart';
import '../movie.dart';
import '../widgets/movie_card.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

int backgroundIndex = 0;

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  List<Movie> movies = [];

  void fun() => {};
  @override
  void initState() {
    pageController = PageController(
      viewportFraction: .8,
      initialPage: 0,
    )..addListener(fun);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> MovieBloc(),
      child: BlocConsumer<MovieBloc,MovieStatus>(
        listener: (context, state){},
        builder:(context,state){
          return Scaffold(
              body: FutureBuilder<List<Movie>>(
                  future: fetchMovie(),
                  builder: (context, snapshot) {
                    /// displaying data
                    if (snapshot.hasData) return _buildListData(snapshot);

                    /// displaying progress
                    return buildProgressWidget();
                  }
              )
          );
        },
      ),
    );
  }
  Widget _buildListData(AsyncSnapshot<List<Movie>> snapshot) {
   movies = snapshot.data ?? [];
    Movie movie = movies[backgroundIndex];
    return Stack(
      children: [appImage(movie.poster), buildBody(movies[backgroundIndex])],
    );
  }

  Widget buildBody(Movie movie) {
    return SingleChildScrollView(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(
            children: [
              AppSizedBox(height: 50.h),
              buildToolbar('Top Rated', Icons.search, context),
              buildPager(backgroundIndex),
              buildMovieText(movie.title, movie.rate, movie.overview),
            ],
          )),
    );
  }

  Widget buildPager(int page) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
           DetailScreen(movies[backgroundIndex])));
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

  Widget buildMovieText(String movieName, String rate, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              AppSizedBox(width: 20.w),
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
              AppSizedBox(width: 20.w),
            ],
          ),
          AppSizedBox(height: 20.h),
          Container(margin: EdgeInsets.only(left: 20, right: 20), child: AppText(text: description))
        ],
      ),
    );
  }

}
Center buildProgressWidget() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget appImage(String img) {
  return Container(
    height: 1.sh,
    width: 1.sw,
    child: CachedNetworkImage(
      key: UniqueKey(),
      fit: BoxFit.cover,
      imageUrl: 'https://image.tmdb.org/t/p/original${img}',
      placeholder: (context, url) => Container(color: Colors.black12),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}

Widget buildToolbar(String text, IconData icon, BuildContext context, {String data = ''}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.w),
    child: InkWell(
      onTap: () {},
      child: Row(
        children: [
          AppSizedBox(width: 40.w),
          Expanded(
              flex:9,
              child: AppText(text: text, color: Colors.white, textSize: 25.sp, fontWeight: FontWeight.bold)),
          /*data == '' ? Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.white,
            size: 30,
          ) : SizedBox(),*/
          Spacer(),
          IconButton(
              onPressed: () {
                icon == Icons.search;
                /*? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchScreen()))
                    : null;*/
              },
              icon: Icon(icon)),
          AppSizedBox(width: 20.w),
        ],
      ),
    ),
  );
}
